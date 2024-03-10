import 'package:flutter/material.dart';

import '../Widgets/home_widget.dart';
import '../Widgets/product_card.dart';
import 'home_screen.dart';

class category extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) => HomeScreen()));
          //     },
          //     icon: Icon(
          //       Icons.chevron_left,
          //       color: Colors.black,
          //     )),
          centerTitle: true,
          title: Text(
            "categories",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ProductCard('assets/img.png', 'name', '199'),
                  const Spacer(),
                  ProductCard('assets/img.png', 'name', '199'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ProductCard('assets/img.png', 'name', '199'),
                  const Spacer(),
                  ProductCard('assets/img.png', 'name', '199'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ProductCard('assets/img.png', 'name', '199'),
                  const Spacer(),
                  ProductCard('assets/img.png', 'name', '199'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ProductCard('assets/img.png', 'name', '199'),
                  const Spacer(),
                  ProductCard('assets/img.png', 'name', '199'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  ProductCard('assets/img.png', 'name', '199'),
                  const Spacer(),
                  ProductCard('assets/img.png', 'name', '199'),
                ],
              ),
            ),
            /*
                  Row(children:[
                Card( 
                  child:
                    Container( width:167 , height: 90.13,decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromRGBO(255, 255, 255, 1),),
                      borderRadius: BorderRadius.circular(10),
                       image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))),
       /*
             Column(
                      children: [
                        Container(
                         width:158 , height: 90.13
                          decoration: ShapeDecoration(
                           color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Image.asset('hamo/assets/fashion 1.png'),
                        ),
                        const Text('Apparel')
                      ],
                    ),*/
    
    
    
    
    
    
    
    
                      SizedBox( 
                  child:Card(child: 
                    Container( width:167 , height: 90.13, decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),)))
    
                      )
          ]),
          Row(children: [   Card( 
                  child:
                    Container( width:167 , height: 90.13,decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                       , image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))),
                      SizedBox( 
                  child:Card(child: 
                    Container( width:167 , height: 90.13, decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))))
    
          ]),
          Row(children: [
               Card( 
                  child:
                    Container( width:167 , height: 90.13,decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                      ,  image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))),
                      SizedBox( 
                  child:Card(child: 
                    Container( width:167 , height: 90.13, decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                      ,  image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))))
          ])
          ,Row(children: [   
            Card( 
                  child:
                    Container( width:167 , height: 90.13,decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                        ,image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))),
                      SizedBox( 
                  child:Card(child: 
                    Container( width:167 , height: 90.13, decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                      ,  image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))))
          ])
          ,Row(children: [   Card( 
                  child:
                    Container( width:167 , height: 90.13,decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                       , image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))),
                      SizedBox( 
                  child:Card(child: 
                    Container( width:167 , height: 90.13, decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                        ,image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))))
                      ]) ,
                      Row(children: [   Card( 
                  child:
                    Container( width:167 , height: 90.13,decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10)
                        ,image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))),
                      SizedBox( 
                  child:Card(child: 
                    Container( width:167 , height: 90.13, decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,),borderRadius: BorderRadius.circular(10) ,
                      image: DecorationImage(
                    image: NetworkImage("https://images.app.goo.gl/u3D1DGaQTgA8boQTA"),
                    fit: BoxFit.fill,
            ),))))
                      ]),  
        ])
          )
          
          ]*/
          ]),
        ));
  }
}





/* */