import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '/constants/app_strings.dart';
import '/constants/app_constants.dart';
import '/screen/login/login.dart';

class RegForm extends StatefulWidget {
  const RegForm({super.key});

  @override
  RegFormState createState() {
    return RegFormState();
  }
}

class RegFormState extends State<RegForm> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationPasswordController = TextEditingController();
  bool _hidePassword = true;
  bool _hideConfirmationPassword = true;

  // global key that uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  void _toggleConfirmationPasswordVisibility() {
    setState(() {
      _hideConfirmationPassword = !_hideConfirmationPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _firstnameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.firstNameError;
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              labelText: LocaleStrings.firstNameLabel,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _lastnameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.lastNameError;
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              labelText: LocaleStrings.lastNameLabel,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.emailError;
              } else if (!AppConstants.emailRegex.hasMatch(value)) {
                return LocaleStrings.invalidEmailError;
              }
              return null;
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              labelText: LocaleStrings.emailLabel,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.passwordError;
              }
              // else if (!AppConstants.passwdRegex.hasMatch(value)) {
              //   return 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and must be at least 8 characters long';
              // }
              return null;
            },
            obscureText: _hidePassword,
            decoration: InputDecoration(
              errorMaxLines: 3,
              suffixIcon: IconButton(
                onPressed: _togglePasswordVisibility,
                icon: _hidePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              contentPadding: const EdgeInsets.all(8),
              labelText: LocaleStrings.passwordLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _confirmationPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.confirmPasswordError;
              } else if (_passwordController.text != value) {
                return LocaleStrings.invalidConfirmPasswordError;
              }
              return null;
            },
            obscureText: _hideConfirmationPassword,
            decoration: InputDecoration(
              errorMaxLines: 3,
              suffixIcon: IconButton(
                onPressed: _toggleConfirmationPasswordVisibility,
                icon: _hidePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              contentPadding: const EdgeInsets.all(8),
              labelText: LocaleStrings.confirmPasswordLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: Consumer<AuthProvider>(
              builder: (context, authModel, _) {
                return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppConstants.primaryColor),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authModel.register(
                          _firstnameController.text,
                          _lastnameController.text,
                          _emailController.text,
                          _passwordController.text,
                          _confirmationPasswordController.text);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(LocaleStrings.registering)));
                    }
                  },
                  child: const Expanded(
                    flex: 1,
                    child: Text(
                      LocaleStrings.registerBtn,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                const TextSpan(text: "${LocaleStrings.alreadyHaveAnAccount} "),
                TextSpan(
                  text: LocaleStrings.loginBtn,
                  style: const TextStyle(color: AppConstants.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
