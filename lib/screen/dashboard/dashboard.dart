import 'package:flt_challenge/components/custom_app_bar.dart';
import 'package:flt_challenge/constants/app_strings.dart';
import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(screen.width,
              AppConstants.defaultAppBarHeight * screen.height * 1),
          child: const FAppBar(
              header: LocaleStrings.dashboardPageHeader,
              description: LocaleStrings.dashboardPageDescription)),
      body: const Center(child: Text("Welcome to Dashboard")),
    );
  }
}
