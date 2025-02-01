import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_app_interface/firebase_options.dart';
import 'package:shopping_app_interface/services/localization_service.dart';
import 'package:shopping_app_interface/views/widgets/SignUp_Screen.dart';
import 'package:shopping_app_interface/views/widgets/shoppingScreen.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// here i'm using the custom localization service and passing the locale change function to the SignUpScreen and ShoppingScreen widgets
// i transfer this widget to be statfull widget to use the changeLocale function in the build method
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Define the default locale as Arabic
  Locale _locale = const Locale('ar', 'EG');

// Define the changeLocale function to change the locale of the app
  void _changeLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      localizationsDelegates: const [
        LocalizationService.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      locale: _locale,
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => SignUpScreen(
              changeLocale: _changeLocale,
            ),
        '/shopping': (context) => ShoppingScreen(
              changeLocale: _changeLocale,
            ),
      },
    );
  }
}
