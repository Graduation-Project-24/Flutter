import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class profed extends StatefulWidget {
  final String token;

  const profed({Key? key, required this.token}) : super(key: key);

  @override
  _ProfileEditorState createState() => _ProfileEditorState();
}

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source:source);
  if(_file!=null){
    return await _file.readAsBytes();
  }
  print("no image is selected");
}

class _ProfileEditorState extends State<profed> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  Uint8List? _image;

  void deleteImage() {
    setState(() {
      _image = null;
    });
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  Future<void> editProfile(BuildContext context) async {
    try {
      var url = Uri.parse("https://www.smarketp.somee.com/api/Account/EditUser");
      var userData = {
        "email": emailController.text,
        "fname": firstNameController.text,
        "lname": lastNameController.text,
        "phone": phoneController.text,
        "city": cityController.text,
        "birthdate": birthdayController.text,
        "state": stateController.text
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
        print("Profile updated successfully");
      } else {
        print("Update failed with status code: ${response.statusCode}");
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
        title: Text('Edit Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildProfileImage(),
          _buildButtonRow(),
          _buildTextField(firstNameController, 'First Name'),
          _buildTextField(lastNameController, 'Last Name'),
          _buildTextField(emailController, 'Email'),
          _buildTextField(phoneController, 'Phone Number'),
          _buildTextField(birthdayController, 'Birthday'),
          _buildTextField(cityController, 'City'),
          _buildTextField(stateController, 'State'),
          SizedBox(height: 20),
         
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Center(
      child: Stack(
        children: [
          _image != null
              ? CircleAvatar(
                  radius: 50,
                  backgroundImage: MemoryImage(_image!),
                )
              : CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "https://images.app.goo.gl/DPgya8wRt1c5a6fq5"),
                ),
          Positioned(
            child: IconButton(
              onPressed: () {
                selectImage();
              },
              icon: Icon(Icons.add_a_photo_outlined),
            ),
            bottom: -10,
            left: 60,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          onPressed: () {
            editProfile(context);
          },
          height: 33,
          minWidth: 90,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color(0xff3f4c54),
          child: Text(
            "Replace",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(width: 10),
        MaterialButton(
          onPressed: () {
            // Handle delete image
            showbottomsheet();
          },
          height: 33,
          minWidth: 90,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Color.fromARGB(255, 255, 157, 11),
          child: Text(
            "Delete image",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  showbottomsheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 250,
            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
                color: Color(0xFF354249),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (() {}),
                  child: Text(
                    "Deleting",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "Are you sure that you want to delete this cute image?",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 450,
                  height: 50,
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    child: Text(
                      "Delete",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      deleteImage();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xFFFA3333)),
                  ),
                )
              ],
            ),
          );
        });
  }
}
