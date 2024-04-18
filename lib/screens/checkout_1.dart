import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:linked_all_pages/screens/forget1.dart';

import 'checkout_2.dart';

class check1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: test(),
    );
  }
}

// ignore: camel_case_types
class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

// ignore: camel_case_types
class _testState extends State<test> {
  TextEditingController countrycode = TextEditingController();
  void initState() {
    // TODO: implement initState
    countrycode.text = "+92";
    super.initState();
  }

  var selected_country = "usa";
  var state = "syria";
  var state1 = true;
  var state2 = true;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return forget(); // change to cartscreen
                }));
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
              )),
          centerTitle: true,
          title: const Text(
            "Checkout",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 40,
              width: 200,
              child: Image.asset('assets/Group 3.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                      child: Text("Enter Shipping Details",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: const Text(
                        "Full Name*",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Full Name ",
                        hintStyle: const TextStyle(color: Color(0xFFC0C0C0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFE6E2E2), width: 2),
                          borderRadius: BorderRadius.circular(11),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  Form(
                      child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),

                      //phone field with country code

                      IntlPhoneField(
                        decoration: const InputDecoration(
                            labelText: "phone",
                            border:
                                OutlineInputBorder(borderSide: BorderSide())),
                        initialCountryCode: 'IN',
                        onChanged: (phone) {
                          print(phone.completeNumber);
                        },
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                        ),
                      )
                    ],
                  )),

                  //                  Container(
                  //   height: 55,
                  //    decoration: BoxDecoration(
                  //   border: Border.all(width: 1 ,color: Color(0xFFC0C0C0)) ,
                  //   borderRadius: BorderRadius.circular(10)
                  // ),
                  //   child: Row(
                  //     children: [
                  //       SizedBox(
                  //           width: 10,
                  //         ),
                  //       SizedBox(
                  //         width: 40,
                  //         child: TextField(
                  //           controller: countrycode,
                  //           decoration: InputDecoration(
                  //             border: InputBorder.none
                  //           ),
                  //         ) ,),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text("|", style: TextStyle(fontSize: 33 , color: Colors.grey)),
                  //       SizedBox( width: 10,),

                  //         Expanded(

                  //         child: TextField(

                  //            decoration: InputDecoration(
                  //             border: InputBorder.none
                  //             , hintText: "phone"
                  //            , hintStyle:  TextStyle(color: Color(0xFFC0C0C0) , )
                  //           ),
                  //         ) ,),
                  //     //
                  //     ],
                  //   ),
                  // )

                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: const Color(0xFFE6E2E2))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: const Text("state"),
                          items: ["syria", "state"]
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text("$e"),
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              state = val!;
                            });
                          },
                          value: state,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 2, color: const Color(0xFFE6E2E2))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: const Text("select city"),
                          items: ["syria", "usa", "egypt", "ksa", "city"]
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              selected_country = val!;
                            });
                          },
                          value: selected_country,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: const Text(
                        "Street Address*",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter street adress ",
                        hintStyle: const TextStyle(color: Color(0xffBABABA)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFE6E2E2), width: 2),
                          borderRadius: BorderRadius.circular(11),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: const Text(
                        " Postal code*",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter postal code ",
                        hintStyle: const TextStyle(color: Color(0xffBABABA)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFE6E2E2), width: 2),
                          borderRadius: BorderRadius.circular(11),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 450,
                    height: 50,
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return chekkk();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xFFFAA933)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 200,
                            ),
                            Icon(Icons.chevron_right, color: Colors.white)
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
