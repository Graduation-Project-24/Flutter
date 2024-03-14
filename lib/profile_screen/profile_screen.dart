import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:linked_all_pages/Widgets/home_widget.dart';
import 'package:linked_all_pages/profile_screen/edit_profile.dart';
import 'package:linked_all_pages/profile_screen/logout.dart';
import 'package:linked_all_pages/screens/about_screen.dart';
import 'package:linked_all_pages/screens/charttt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_screen.dart';

class profile_screen extends StatelessWidget {
  final String token;

  const profile_screen({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userInfo = token != null ? decodeJwt(token!) : {};

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return HomeWidget(token: token);
                }));
              },
              icon: const Icon(Icons.chevron_left, color: Colors.white)),
          centerTitle: true,
          title: const Text(
            "profile",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => chart()));
                },
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.white))
          ],
          backgroundColor: const Color(0xff414E56),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      const Text(
                        "My Account",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xff000000)),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile(
                                          token: token,
                                        )));
                          },
                          child: const Icon(Icons.edit))
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 325,
                      height: 349,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD5E2EA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Text("Username"),
                            subtitle:
                                Text(userInfo['unique_name'] ?? 'No Username'),
                            leading: Icon(
                              Icons.badge_sharp,
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          ListTile(
                            title: Text("Email"),
                            subtitle:
                                Text(userInfo['email'] ?? 'No Email Address'),
                            leading: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          ListTile(
                            title: Text("Phone Number"),
                            subtitle: Text(
                                userInfo['mobilephone'] ?? 'No Phone Number'),
                            leading: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          ListTile(
                            title: Text("Address"),
                            subtitle: Text(
                                '${userInfo['City']}, ${userInfo['State'] ?? 'No State'}, ${userInfo['City']}' ??
                                    'No City'),
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: const Text("Addition settings",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff000000))),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 325,
                      height: 125,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD5E2EA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: ListView(
                        children: [
                          ListTile(
                            title: const Text("Forget Password"),
                            leading: const Icon(Icons.language,
                                color: Color(0xff000000)),
                            trailing: const Icon(Icons.chevron_right_outlined,
                                color: Color(0xff000000)),
                            onTap: () {
                              /* Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ForgetPassword();
                              }));*/
                            },
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          ListTile(
                              title: const Text("Change Password"),
                              leading: const Icon(Icons.flag,
                                  color: Color(0xff000000)),
                              trailing: const Icon(Icons.chevron_right_outlined,
                                  color: Color(0xff000000)),
                              onTap: () {
                                /*  Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ForgetPassword();
                                }));*/
                              })
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Reach Out TO Us ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff000000))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 325,
                      height: 200,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD5E2EA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: ListView(children: [
                        ListTile(
                            title: Text("Help"),
                            leading: Icon(Icons.help_center_rounded,
                                color: Color(0xff000000)),
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return AboutScreen();
                              }));
                            }),
                        Divider(
                          color: Colors.black,
                        ),
                        ListTile(
                            title: Text("Contact Us"),
                            leading: IconButton(
                              onPressed: (() {
                                showBottomSheet(context);
                              }),
                              icon: Icon(Icons.phone),
                              color: Colors.black,
                            )),
                        Divider(
                          color: Colors.black,
                        ),
                        ListTile(
                          title: Text("About us"),
                          leading: Icon(
                            Icons.info,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutScreen()));
                          },
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 325,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD5E2EA),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: ListTile(
                        onTap: () async {
                          // Show loading indicator
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );

                          LogoutService logoutService = LogoutService();
                          bool isLoggedOut = await logoutService.logout(token!);

                          // Close loading indicator
                          Navigator.pop(context);

                          if (isLoggedOut) {
                            // Delete token from cache
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.remove('token');

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return const LoginScreen();
                            }));
                          } else {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return profile_screen(token: token);
                            }));
                          }
                        },
                        title: Text("Logout"),
                        leading: Icon(
                          Icons.power_settings_new_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 250,
          padding: EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
              color: Color(0xFF354249),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "Contact Us",
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
                    "    +01274974780",
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
                    "Call Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xFFFAA933),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Map<String, dynamic> decodeJwt(String token) {
    // Split the token into its three parts
    List<String> parts = token.split('.');

    // Extract the payload part
    String payloadBase64 = parts.length > 1 ? parts[1] : '';

    // Add padding characters if needed
    int missingPadding = (4 - payloadBase64.length % 4) % 4;
    payloadBase64 += '=' * missingPadding;

    // Decode the payload from base64
    String payloadJson = utf8.decode(base64Url.decode(payloadBase64));

    // Parse the payload JSON
    Map<String, dynamic> payloadMap = jsonDecode(payloadJson);

    return payloadMap;
  }
}



// import 'dart:convert';
// import 'package:flutter/material.dart';

// String decodeJwt(String token) {
//   // Split the token into its three parts
//   List<String> parts = token.split('.');

//   // Extract the payload part
//   String payloadBase64 = parts.length > 1 ? parts[1] : '';

//   // Add padding characters if needed
//   int missingPadding = (4 - payloadBase64.length % 4) % 4;
//   payloadBase64 += '=' * missingPadding;

//   // Decode the payload from base64
//   String payloadJson = utf8.decode(base64Url.decode(payloadBase64));

//   // Parse the payload JSON
//   Map<String, dynamic> payloadMap = jsonDecode(payloadJson);

//   // Extract information from the payload
//   String? userId = payloadMap['nameid'];
//   String? userName = payloadMap['unique_name'];
//   String? role = payloadMap['role'];
//    String? email = payloadMap['email'];
//     String? mobilephone = payloadMap['mobilephone'];
//      String? City = payloadMap['City'];
//       String? State = payloadMap['State'];
//        String? birthdate = payloadMap['birthdate'];



//   // int? notBefore = payloadMap['nbf'];
//   // int? expiry = payloadMap['exp'];
//   // int? issuedAt = payloadMap['iat'];

//   // Return the extracted information
//   return '''
//     User ID: $userId
//     Username: $userName
//     Role: $role
//     email:$email
//     mobilephone:$mobilephone
//     City:$City
//     State:$State
//     birthdate:$birthdate

//   ''';
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Example JWT token
//     String token =
//         'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxMTkiLCJ1bmlxdWVfbmFtZSI6IkhhbWRhMTI1IiwiZW1haWwiOiJNb2hhbWVkLkFiZGVsYXppekBleGFtcGxlLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiKzIwMTIxMDY3NTc4OSIsImZhbWlseV9uYW1lIjoiaGF6ZW0iLCJnaXZlbl9uYW1lIjoiTW9oYW1lZEhhemVtIiwiQ2l0eSI6IkFsZXhhbmRyaWEiLCJTdGF0ZSI6IkFsZXhhbmRyaWEiLCJiaXJ0aGRhdGUiOiI5LzEwLzIwMjUgMTI6MDA6MDAgQU0iLCJyb2xlIjoiVXNlciIsIm5iZiI6MTcwOTk5NDM4MywiZXhwIjoxNzEyNTgyNzgzLCJpYXQiOjE3MDk5OTQzODN9.o1ip8yuvv3Ppa2tyqk2hteBM6K1VSKd6Q1eWZQjYGJTCuP6DDCDBvK_LfF3NUGbsUPM2ywPB49k1XYF_ZW-coA';

//     // Decode the JWT and extract information
//     String userInfo = decodeJwt(token);

//     return MaterialApp(
//       title: 'JWT Decoding Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('User Information'),
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Text(
//                 userInfo,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
