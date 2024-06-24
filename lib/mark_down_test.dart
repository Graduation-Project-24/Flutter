// // ignore_for_file: prefer_const_constructors, prefer_final_fields

// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   static const customSwatch = MaterialColor(
//     0xFFFF5252,
//     <int, Color>{
//       50: Color(0xFFFFEBEE),
//       100: Color(0xFFFFCDD2),
//       200: Color(0xFFEF9A9A),
//       300: Color(0xFFE57373),
//       400: Color(0xFFEF5350),
//       500: Color(0xFFFF5252),
//       600: Color(0xFFE53935),
//       700: Color(0xFFD32F2F),
//       800: Color(0xFFC62828),
//       900: Color(0xFFB71C1C),
//     },
//   );

//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: customSwatch,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String _markdownData = """
//   # Minimal Markdown Test
//   ---
//   This is a simple Markdown test. Provide a text string with Markdown tags
//   to the Markdown widget and it will display the formatted output in a
//   scrollable widget.
  
//   ## Section 1
//   Maecenas eget **arcu egestas**, mollis ex vitae, posuere magna. Nunc eget
//   aliquam tortor. Vestibulum porta sodales efficitur. Mauris interdum turpis
//   eget est condimentum, vitae porttitor diam ~~ornare~~. [eclectify](www.eclectify.com)
  
//   ![](resource:assets/flutter_logo.png)
  
//   ### Subsection A
//   *Sed et massa finibus*, blandit massa vel, vulputate velit. Vestibulum vitae
//   venenatis libero. **__Curabitur sem lectus, feugiat eu justo in, eleifend
//   accumsan ante.__** 
//   > Sed a fermentum elit. Curabitur sodales metus id mi
//   > ornare, in ullamcorper magna congue.
  
//   Mauris interdum turpis eget est condimentum, vitae porttitor diam ornare.
  
//   ![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/512px-Google-flutter-logo.svg.png)
  
//   1. ajdsks
//      1. this requires 3 spaces
//      2. fdlefkl
//   2. reorek
//   3. fdpopore
//  """;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Markdown"),
//       ),
//       body: SafeArea(
//         child: Markdown(
//           data: _markdownData,
//         ),
//       ),
//     );
//   }
// }
