import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shopping_app_interface/services/localization_service.dart';

class SignUpScreen extends StatefulWidget {
  // here we get the changeLocale function from the parent widget
  final Function(Locale) changeLocale;
  const SignUpScreen({super.key, required this.changeLocale});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();

  bool _isFadingOut = false;

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) {
          final l10n = Localizations.of<LocalizationService>(
              context, LocalizationService)!;
          return AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.6),
            title: Text(
              l10n.translate('successTitle'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              l10n.translate('successMessage'),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  setState(() {
                    _isFadingOut = true;
                  });
                  Future.delayed(100.ms, () {
                    Navigator.pushReplacementNamed(context, '/shopping');
                  });
                },
                child: Text(
                  l10n.translate('ok'),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          );
        },
      );
    } else {
      final l10n =
          Localizations.of<LocalizationService>(context, LocalizationService)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.translate('validationFullName'))),
      );
    }
  }

  String? _validateEmail(String? value) {
    final l10n =
        Localizations.of<LocalizationService>(context, LocalizationService)!;
    if (value == null || value.isEmpty) {
      return l10n.translate('validationEmail');
    }
    if (!value.contains("@") || !value.contains(".")) {
      return "Please enter a valid email address must contain '@' and '.'";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    final l10n =
        Localizations.of<LocalizationService>(context, LocalizationService)!;
    if (value == null || value.isEmpty) {
      return l10n.translate('validationPassword');
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    final l10n =
        Localizations.of<LocalizationService>(context, LocalizationService)!;
    if (value == null || value.isEmpty) {
      return l10n.translate('validationConfirmPassword');
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  String? _validateFullName(String? value) {
    final l10n =
        Localizations.of<LocalizationService>(context, LocalizationService)!;
    if (value == null || value.isEmpty) {
      return l10n.translate('validationFullName');
    }
    if (value[0] != value[0].toUpperCase()) {
      return "Full name must start with an uppercase letter";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n =
        Localizations.of<LocalizationService>(context, LocalizationService)!;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          l10n.translate('appTitle'),
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          // this action button will change the language of the app
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              final newLocale =
                  Localizations.localeOf(context).languageCode == 'ar'
                      ? const Locale('en', 'US')
                      : const Locale('ar', 'EG');
              widget.changeLocale(newLocale);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 147, 147, 147).withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          l10n.translate('signUp'),
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: l10n.translate('fullName'),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: _validateFullName,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: l10n.translate('email'),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: _validateEmail,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: l10n.translate('password'),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                          validator: _validatePassword,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: l10n.translate('confirmPassword'),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.6),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          obscureText: true,
                          validator: _validateConfirmPassword,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _signUp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 4, 4, 4)
                                .withOpacity(0.8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            l10n.translate('signUp'),
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate(target: _isFadingOut ? 1 : 0).fadeOut(duration: 500.ms);
  }
}
