// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:linked_all_pages/Widgets/text_field_widget.dart';
// import 'package:linked_all_pages/screens/auth_screens/auth_cubit/auth_cubit.dart';
// import 'package:linked_all_pages/screens/auth_screens/register_screen.dart';
// // import '../../../layout/layout_screen.dart';
// // import '../../Widgets/alert_dialog.dart';
// import '../cate test.dart';
// import '../forget1.dart';
// import 'auth_cubit/auth_states.dart';

// class LoginScreen extends StatefulWidget {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   bool remember = false;
//   LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
//     return Scaffold(
//       body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage("images/auth_background.png"),
//                   fit: BoxFit.fill)),
//           child: BlocConsumer<AuthCubit, AuthStates>(
//             listener: (context, state) {
//               // if( state is LoginLoadingState )
//               // {
//               //   showAlertDialog(
//               //       context: context,
//               //       backgroundColor: Colors.white,
//               //       content: AnimatedContainer(
//               //         duration: const Duration(seconds: 1),
//               //         curve: Curves.easeIn,
//               //         child: Row(
//               //           children:
//               //           [
//               //             const CupertinoActivityIndicator(color: mainColor),
//               //             SizedBox(width: 12.5,),
//               //             const Text("wait",style: TextStyle(fontWeight: FontWeight.w500),),
//               //           ],
//               //         ),
//               //       )
//               //   );
//               // }
//               // else if( state is FailedToLoginState )
//               // {
//               //   // showAlertDialog(
//               //   //     context: context,
//               //   //     backgroundColor: Colors.red,
//               //   //     content: Text(state.message,textDirection: TextDirection.rtl,)
//               //   // );
//               // }
//               // else if ( state is LoginSuccessState )
//               // {
//               //   Navigator.pop(context);   // عشان يخرج من alertDialog
//               //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LayoutScreen()));
//               // }
//             },
//             builder: (context, state) {
//               return Scaffold(
//                 body: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                         "assets/Login.png",
//                         // width: 200,
//                         // height: 200,
//                       ),
//                       const Text("Welcome To Smarket",
//                           style: TextStyle(
//                               fontSize: 26,
//                               fontWeight: FontWeight.w700,
//                               color: Color(0xff364A5A))),
//                       const Text("Ship Smarter Today",
//                           style: TextStyle(
//                               fontSize: 24,
//                               color: Color(0xff364A5A),
//                               fontWeight: FontWeight.w400)),
//                       TextFieldWidget(
//                         hintTitle: "Email",
//                         type: TextInputType.emailAddress,
//                         controller: emailController,
//                       ),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       TextFieldWidget(
//                         hintTitle: "Password",
//                         type: TextInputType.emailAddress,
//                         controller: emailController,
//                       ),
//                       Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Checkbox(
//                                     checkColor: Colors.amber,
//                                     value: remember,
//                                     onChanged: (val) {
//                                       setState(() {
//                                         remember = val!;
//                                       });
//                                     }),
//                                 const Text("Remember me"),
//                               ],
//                             ),
//                             TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).push(
//                                       MaterialPageRoute(builder: (context) {
//                                     return forget();
//                                   }));
//                                 },
//                                 child: const Text("Forget password?")),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         width: 450,
//                         padding: const EdgeInsets.only(top: 90, bottom: 10),
//                         child: ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => HomeScreen()));
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromARGB(255, 255, 157, 11)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
//                                 Text(
//                                   "Sign in",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 Icon(Icons.logout_outlined,
//                                     color: Color.fromARGB(255, 0, 0, 0))
//                               ],
//                             )),
//                       ),
//                       Container(
//                         width: 450,
//                         padding: const EdgeInsets.only(top: 10),
//                         child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context)
//                                   .push(MaterialPageRoute(builder: (context) {
//                                 return RegisterScreen();
//                               }));
//                             },
//                             style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     const Color.fromARGB(186, 213, 226, 234)),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
//                                 Text(
//                                   "Create Account",
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                                 Icon(Icons.add_box_outlined,
//                                     color: Colors.black)
//                               ],
//                             )),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           )),
//     );
//   }
// }
