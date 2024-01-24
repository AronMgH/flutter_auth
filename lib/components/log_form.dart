import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/provider/auth_provider.dart';
import '/constants/app_constants.dart';
import '/constants/app_strings.dart';
import '/screen/register/register.dart';

class LgForm extends StatefulWidget {
  const LgForm({super.key});

  @override
  LgFormState createState() {
    return LgFormState();
  }
}

class LgFormState extends State<LgForm> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // bool showFailure = false;
  bool _hidePassword = true;

  // global key that uniquely identifies the Form widget and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordVisibility() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
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
              return null;
            },
            obscureText: _hidePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: togglePasswordVisibility,
                icon: _hidePassword
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
              contentPadding: const EdgeInsets.all(8),
              labelText: LocaleStrings.passwordLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 28),
          const SizedBox(
            width: double.infinity,
            child: Text(
              LocaleStrings.forgotPassword,
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppConstants.primaryColor),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: Consumer<AuthProvider>(builder: (context, authProvider, _) {
              return ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppConstants.primaryColor),
                    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(LocaleStrings.loggingin)));
                    // emit login event
                    authProvider.login(
                        _emailController.text, _passwordController.text);
                  }
                },
                child: const Expanded(
                    flex: 1,
                    child: Text(
                      LocaleStrings.loginBtn,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    )),
              );
            }),
          ),
          const SizedBox(height: 20),
          const Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Divider(
                height: 10,
                color: Colors.black12,
              )),
              SizedBox(
                width: 20,
              ),
              Text(
                LocaleStrings.orLoginWith,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Divider(
                height: 10,
                color: Colors.black12,
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppConstants.googleSvg,
                    width: 16,
                  ),
                  onPressed: () {},
                  label: const Text(
                    LocaleStrings.google,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              // const Spacer(),
              Expanded(
                child: OutlinedButton.icon(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    AppConstants.facebookSvg,
                    width: 16,
                  ),
                  onPressed: () {},
                  label: const Text(LocaleStrings.facebook),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
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
              ]))
        ],
      ),
    );
  }
}
