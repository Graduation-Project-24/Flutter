// // import 'package:code_app/modules/Screens/auth_screens/login_screen.dart';
// // import 'package:code_app/shared/style/colors.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:linked_all_pages/Widgets/text_field_widget.dart';
// import 'package:linked_all_pages/screens/auth_screens/login_screen.dart';
// import 'package:linked_all_pages/screens/home_screen.dart';
// import 'auth_cubit/auth_cubit.dart';
// import 'auth_cubit/auth_states.dart';

// class RegisterScreen extends StatelessWidget {
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final firstNameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final dateOfBirthController = TextEditingController();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   RegisterScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthCubit, AuthStates>(
//       listener: (context, state) {
//         if (state is RegisterLoadingState) {
//         } else if (state is FailedToRegisterState) {
//         } else if (state is RegisterSuccessState) {
//           Navigator.pop(context); // عشان يخرج من alertDialog
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => const HomeScreen()));
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           body: Center(
//             child: Form(
//               key: formKey,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SingleChildScrollView(
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
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           TextFieldWidget(
//                               hintTitle: "First Name",
//                               type: TextInputType.name,
//                               controller: firstNameController,
//                               icon: const Icon(Icons.person)),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextFieldWidget(
//                               hintTitle: "last Name",
//                               controller: lastNameController,
//                               type: TextInputType.name,
//                               icon: const Icon(Icons.person)),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFieldWidget(
//                           hintTitle: "Email",
//                           controller: emailController,
//                           type: TextInputType.emailAddress,
//                           icon: const Icon(Icons.email)),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           TextFieldWidget(
//                               hintTitle: "Phone",
//                               controller: phoneController,
//                               type: TextInputType.phone,
//                               icon: const Icon(Icons.phone)),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           TextFieldWidget(
//                             hintTitle: "dateOfBirth",
//                             controller: dateOfBirthController,
//                             type: TextInputType.datetime,
//                             icon: const Icon(Icons.date_range),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       TextFieldWidget(
//                         hintTitle: "Password",
//                         controller: passwordController,
//                         type: TextInputType.text,
//                         icon: const Icon(Icons.lock),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       MaterialButton(
//                         minWidth: double.infinity,
//                         elevation: 0,
//                         height: 40,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4)),
//                         color: Colors.blue,
//                         onPressed: () {
//                           if (formKey.currentState!.validate() == true) {
//                             BlocProvider.of<AuthCubit>(context).register(
//                               email: emailController.text,
//                               firstName: firstNameController.text,
//                               lastName: lastNameController.text,
//                               phone: phoneController.text,
//                               password: passwordController.text,
//                               dateOfBirth: dateOfBirthController.text,
//                             );
//                           }
//                         },
//                         child: FittedBox(
//                             fit: BoxFit.scaleDown,
//                             child: Text(
//                               state is RegisterLoadingState
//                                   ? "Loading..."
//                                   : "Register",
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.5,
//                                   color: Colors.white),
//                             )),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text('Already have an account? ',
//                               style: TextStyle(color: Colors.black)),
//                           const SizedBox(
//                             width: 4,
//                           ),
//                           InkWell(
//                             onTap: () {
//                               // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//                             },
//                             child: const Text('login in',
//                                 style: TextStyle(
//                                     color: Colors.blue,
//                                     fontWeight: FontWeight.bold)),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // TextFormField Item as I use it more than one time
//   Widget textFormItem(
//       {required String hintTitle, required TextEditingController controller}) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//           hintText: hintTitle, border: const OutlineInputBorder()),
//       validator: (input) {
//         if (controller.text.isNotEmpty) {
//           return null;
//         } else {
//           return "$hintTitle must not be empty!";
//         }
//       },
//     );
//   }
// }
