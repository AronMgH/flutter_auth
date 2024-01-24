import 'package:flt_challenge/bloc/auth_provider.dart';
import 'package:flt_challenge/constants/app_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/app_strings.dart';
import '../screen/register/register.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  ChangePasswordFormState createState() {
    return ChangePasswordFormState();
  }
}

class ChangePasswordFormState extends State<ChangePasswordForm> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmationPasswordController = TextEditingController();

  bool _hideOldPassword = true;
  bool _hideNewPassword = true;
  bool _hideConfirmationPassword = true;

  // global key that uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmationPasswordController.dispose();
    super.dispose();
  }

  void _toggleOldPasswordVisibility() {
    setState(() {
      _hideOldPassword = !_hideOldPassword;
    });
  }

  void _toggleNewPasswordVisibility() {
    setState(() {
      _hideNewPassword = !_hideNewPassword;
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
            controller: _oldPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.oldPasswordError;
              }
              return null;
            },
            obscureText: _hideOldPassword,
            decoration: InputDecoration(
              errorMaxLines: 3,
              suffixIcon: IconButton(
                onPressed: _toggleOldPasswordVisibility,
                icon: _hideOldPassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              contentPadding: const EdgeInsets.all(8),
              labelText: LocaleStrings.oldPasswordLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _newPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.newPasswordError;
              }
              // else if (!AppConstants.passwdRegex.hasMatch(value)) {
              //   return 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and must be at least 8 characters long';
              // }
              return null;
            },
            obscureText: _hideNewPassword,
            decoration: InputDecoration(
              errorMaxLines: 3,
              suffixIcon: IconButton(
                onPressed: _toggleNewPasswordVisibility,
                icon: _hideNewPassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              contentPadding: const EdgeInsets.all(8),
              labelText: LocaleStrings.newPasswordLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: _confirmationPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return LocaleStrings.confirmPasswordError;
              } else if (_newPasswordController.text != value) {
                return LocaleStrings.invalidConfirmPasswordError;
              }
              return null;
            },
            obscureText: _hideConfirmationPassword,
            decoration: InputDecoration(
              errorMaxLines: 3,
              suffixIcon: IconButton(
                onPressed: _toggleConfirmationPasswordVisibility,
                icon: _hideConfirmationPassword
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
              builder: (context, authProvider, child) {
                return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppConstants.primaryColor),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authProvider.changePassword(
                          _oldPasswordController.text,
                          _newPasswordController.text,
                          _confirmationPasswordController.text);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(LocaleStrings.changingPassword)));
                    }
                  },
                  child: const Expanded(
                    flex: 1,
                    child: Text(
                      LocaleStrings.changePasswordBtn,
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
                const TextSpan(text: LocaleStrings.donotHaveAnAccount),
                TextSpan(
                    text: LocaleStrings.registerBtn,
                    style: const TextStyle(color: AppConstants.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      })
              ],
            ),
          )
        ],
      ),
    );
  }
}
