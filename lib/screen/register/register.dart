import "package:flt_challenge/constants/app_strings.dart";
import "package:flutter/material.dart";

import "../../components/custom_app_bar.dart";
import "../../components/reg_form.dart";
import "../../constants/app_constants.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
              screen.width, AppConstants.defaultAppBarHeight * screen.height),
          child: const FAppBar(
            header: LocaleStrings.registerPageHeader,
            description: LocaleStrings.registerPageDescription,
          )),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: RegForm(),
        ),
      ),
    );
  }
}
