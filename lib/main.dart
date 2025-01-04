import 'package:flutter/material.dart';
import 'package:shopping_app_interface/widgets/SignUp_Screen.dart';
import 'package:shopping_app_interface/widgets/shoppingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpScreen(),
        '/shopping': (context) => ShoppingScreen(),
      },
    );
  }
}
