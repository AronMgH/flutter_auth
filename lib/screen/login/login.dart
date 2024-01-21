import "package:flt_challenge/components/custom_app_bar.dart";
import "package:flt_challenge/constants/app_constants.dart";
import "package:flutter/material.dart";

import "../../components/log_form.dart";
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(screen.width, AppConstants.defaultAppBarHeight * screen.height * 1), child: const FAppBar(header:'Sign in to your Account', description: 'Sign in to your Account',)),
      body: const Center(
        // child: Text('Login Screen body'),
        child:Padding(
          padding: EdgeInsets.all(24.0),
          child: LgForm(),
        )
      ),
    );
  }
}