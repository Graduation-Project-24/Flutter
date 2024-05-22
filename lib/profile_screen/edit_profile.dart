import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:linked_all_pages/profile_screen/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class EditProfile extends StatefulWidget {
  final String token;

  const EditProfile({Key? key, required this.token}) : super(key: key);

  @override
  _ProfileEditorState createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<EditProfile> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    decodeToken();
  }

  void decodeToken() {
    try {
      Map<String, dynamic> tokenData = Jwt.parseJwt(widget.token);
      setState(() {
        print(tokenData);
        usernameController.text = tokenData['unique_name'] ?? '';
        firstNameController.text = tokenData['given_name'] ?? '';
        lastNameController.text = tokenData['family_name'] ?? '';
        emailController.text = tokenData['email'] ?? '';
        phoneController.text = tokenData[
                "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone"] ??
            '';
        birthdayController.text = tokenData['birthdate'] ?? '';
        addressController.text = tokenData[
                "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/streetaddress"] ??
            '';
      });
    } catch (e) {
      print("Error decoding token: $e");
    }
  }

  Future<Uint8List?> pickImage(ImageSource source) async {
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
    print("No image is selected");
    return null;
  }

  void deleteImage() {
    setState(() {
      _image = null;
    });
  }

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
  }

  Future<void> editProfile(BuildContext context) async {
    try {
      var url =
          Uri.parse("https://www.smarketp.somee.com/api/Account/EditUserV2");
      var userData = {
        "LastName": lastNameController.text,
        "FirstName": firstNameController.text,
        "PhoneNumber": phoneController.text,
        "City": addressController.text,
      };

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = widget.token;

      if (token == null) {
        print("Token not found");
        return;
      }

      var response = await http.put(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var newToken = responseData['token'];
        await prefs.setString('token', newToken);

        // Update the state with new data
        setState(() {
          // Update controllers with new data
          lastNameController.text = userData["LastName"]!;
          firstNameController.text = userData["FirstName"]!;
          phoneController.text = userData["PhoneNumber"]!;
          addressController.text = userData["City"]!;
        });

        // Decode the new token to update other fields
        decodeToken();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Profile updated successfully"),
          ),
        );
        // Navigate to the profile screen
// Navigate to the profile screen with the new token
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => profile_screen(token: newToken),
          ),
        );
      } else {
        print("Update failed with status code: ${response.statusCode}");
        print("Response body: ${response.body}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update profile: ${response.statusCode}'),
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildProfileImage(),
          _buildButtonRow(),
          _buildTextField(usernameController, 'Username', enabled: false),
          _buildTextField(firstNameController, 'First Name'),
          _buildTextField(lastNameController, 'Last Name'),
          _buildTextField(emailController, 'Email', enabled: false),
          _buildTextField(phoneController, 'Phone Number'),
          _buildTextField(birthdayController, 'Birthday', enabled: false),
          _buildTextField(addressController, 'Address'),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    Map<String, dynamic> tokenData = Jwt.parseJwt(widget.token);
    String? imageUrl = tokenData['imageUrl'];

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: imageUrl != null
                ? NetworkImage(imageUrl)
                : const AssetImage('assets/ProfileImage.png')
                    as ImageProvider<Object>?,
          ),
          Positioned(
            bottom: -10,
            left: 60,
            child: IconButton(
              onPressed: () {
                selectImage();
              },
              icon: const Icon(Icons.add_a_photo_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton("Confirm Edit", () => editProfile(context),
            color: const Color(0xff3f4c54)),
        const SizedBox(width: 10),
        _buildButton("Delete Image", () => showBottomSheet(),
            color: const Color.fromARGB(255, 255, 157, 11)),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed, {Color? color}) {
    return MaterialButton(
      onPressed: onPressed,
      height: 33,
      minWidth: 90,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          decoration: const BoxDecoration(
            color: Color(0xFF354249),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: const Text(
                  "Deleting",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {},
                child: const Text(
                  "Are you sure that you want to delete this cute image?",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: 450,
                height: 50,
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    deleteImage();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color(0xFFFA3333),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
