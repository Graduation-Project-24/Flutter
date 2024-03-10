import 'package:flutter/material.dart';

import 'package:linked_all_pages/screens/checkout_1.dart';

import 'check3_1.dart';

class chekkk extends StatelessWidget {
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
  var select1 = true;
  var select2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return check1();
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image.asset('assets/Group 3.png'),
                  const Center(
                      child: Text("Select a Payment Method",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700))),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckboxListTile(
                    shape: const CircleBorder(),
                    title: const Text("stripe"),
                    secondary: Card(
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/52x68"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    value: select1,
                    onChanged: (val) {
                      setState(() {
                        select1 = val!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    shape: const CircleBorder(),
                    title: const Text("PayPal"),
                    secondary: Card(
                      child: Container(
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/52x68"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    value: select2,
                    onChanged: (val) {
                      setState(() {
                        select2 = val!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 5),
                      child: const Text(
                        "Card Holder Name",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter card holder name ",
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
                        "Card Number",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "4111 1111 1111 1111",
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
                  Column(children: [
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "Expiry date",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )),
                        const SizedBox(
                          width: 130,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "CVV",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(90, 157, 157, 157))),
                              hintText: "MM/XX",
                              hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                        ),
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.datetime,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(90, 157, 157, 157))),
                              hintText: "123",
                              hintStyle: TextStyle(color: Color(0xff9D9D9D))),
                        ),
                      ),
                    ]),
                  ]),
                  const SizedBox(
                    height: 90,
                  ),
                  Container(
                    width: 450,
                    height: 50,
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          showbottomsheet();
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
                              "Pay Now",
                              style: TextStyle(color: Colors.white),
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
            ),
            //--Color(0xFF354249)---------------------------------------------------------------------------------------
          ],
        ));
  }

  showbottomsheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 250,
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const check3_1()));
                  },
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Column(children: [
                    Row(
                      children: const [
                        Text(
                          "Total",
                          style: TextStyle(
                            color: Color(0xFF1E1F2E),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 190,
                        ),
                        Text('\$200.00',
                            style: TextStyle(
                              color: Color(0xFF1C1B1B),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Shipping Fee",
                          style: TextStyle(
                            color: Color(0xFF1E1F2E),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 132,
                        ),
                        Text('\$10.00',
                            style: TextStyle(
                              color: Color(0xFF1C1B1B),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 158, 140, 140),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(children: const [
                      Text(
                        "Subtotal",
                        style: TextStyle(
                          color: Color(0xFF1E1F2E),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 135,
                      ),
                      Text('\$210.00',
                          style: TextStyle(
                            color: Color(0xFF1C1B1B),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ))
                    ])
                  ])));
        }

        /*Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            



         InkWell(
            onTap:(() {}),
          child: Row(children: [
            Text("Total", style: TextStyle(
            color: Color(0xFF1E1F2E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
), )
            
          ],),
          )
          ,SizedBox(height: 40,),
          InkWell(
            onTap: (){},
         child: Text(
         '\$200.00',
        style: TextStyle(
        color: Color(0xFF1C1B1B),
        fontSize: 20,
       fontWeight: FontWeight.w600,

))
          ), SizedBox(height: 30,) ,
                 InkWell(
            onTap:(() {}),
          child: Row(children: [
            Text("Shipping Fee", style: TextStyle(
            color: Color(0xFF1E1F2E),
            fontSize: 16,
            fontWeight: FontWeight.w600,
), )
            
          ],),
          )
          ,SizedBox(height: 40,),
          InkWell(
            onTap: (){},
         child: Text(
         '\$10.00',
        style: TextStyle(
        color: Color(0xFF1C1B1B),
        fontSize: 20,
       fontWeight: FontWeight.w600,

))
          )
          ,  Divider(color: Colors.black,) 
          ,   InkWell(
            onTap:(() {}),
          child: Row(children: [
            Text("Subtotal", style: TextStyle(
            color: Color(0xFF1E1F2E),
            fontSize: 24,
            fontWeight: FontWeight.w600,
), )
            
          ],),
          )
          ,SizedBox(height: 40,),
          InkWell(
            onTap: (){},
         child: Text(
         '\$210.00',
        style: TextStyle(
        color: Color(0xFF1C1B1B),
        fontSize: 20,
       fontWeight: FontWeight.w600,

))
          )*/
        );
  }
}
