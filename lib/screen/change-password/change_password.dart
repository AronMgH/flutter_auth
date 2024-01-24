import "package:flt_challenge/components/change_passwd_form.dart";
import "package:flt_challenge/constants/app_strings.dart";
import "package:flutter/material.dart";

import "../../components/custom_app_bar.dart";
import "../../constants/app_constants.dart";

class ChangeePasswordScreen extends StatelessWidget {
  const ChangeePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
              screen.width, AppConstants.defaultAppBarHeight * screen.height),
          child: const FAppBar(
            header: LocaleStrings.changePasswordPageHeader,
            description: LocaleStrings.changePasswordPageDescription,
          )),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: ChangePasswordForm(),
        ),
      ),
    );
  }
}
