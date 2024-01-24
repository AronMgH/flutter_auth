import "package:flt_challenge/bloc/auth_provider.dart";
import "package:flt_challenge/bloc/auth_states.dart";
import "package:flt_challenge/components/custom_app_bar.dart";
import "package:flt_challenge/constants/app_constants.dart";
import "package:flt_challenge/constants/app_strings.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../components/log_form.dart";
import "../dashboard/dashboard.dart";

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) => authProvider.authState
                is Authenticated
            ? const DashboardPage()
            : Scaffold(
                // resizeToAvoidBottomInset: true,
                appBar: PreferredSize(
                    preferredSize: Size(screen.width,
                        AppConstants.defaultAppBarHeight * screen.height * 1),
                    child: const FAppBar(
                      header: LocaleStrings.logInPageHeader,
                      description: LocaleStrings.logInPageDescription,
                    )),
                body: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: SingleChildScrollView(child: LgForm()),
                )));
  }
}
