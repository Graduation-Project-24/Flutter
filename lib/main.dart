import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_all_pages/screens/auth_screens/auth_cubit/auth_cubit.dart';
import 'package:linked_all_pages/screens/splash_screen.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        // BlocProvider(create: (context) => LayoutCubit()..getCarts()..getFavorites()..getBannersData()..getCategoriesData()..getProducts()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
