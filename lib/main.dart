import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_all_pages/home/category_model_for_home.dart';
import 'package:linked_all_pages/screens/auth_screens/auth_cubit/auth_cubit.dart';
import 'package:linked_all_pages/screens/home_screen.dart';
import 'package:linked_all_pages/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp()
      //   MaterialApp(
      //   initialRoute: '/SplashScreen',
      //   debugShowCheckedModeBanner: false,
      //   routes: {
      //     '/SplashScreen': (context) => const SplashScreen(),
      //   },
      // )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        Provider<CategoryModel>(create: (context) => CategoryModel())
        //  LayoutCubit()..getCarts()..getFavorites()..getBannersData()..getCategoriesData()..getProducts()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}

// Widget build(BuildContext context) {
//   return Provider<HomeScreen>(
//     create: (_) => HomeScreen(),
//     // Will throw a ProviderNotFoundError, because `context` is associated
//     // to the widget that is the parent of `Provider<Example>`
//     child: Text(context.watch<HomeScreen>().toString()),
//   );
// }
