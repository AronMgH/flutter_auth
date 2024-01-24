import 'package:flt_challenge/bloc/auth_provider.dart';
import 'package:flt_challenge/constants/app_constants.dart';
import 'package:flt_challenge/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/homepage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Since Authentiation is core part of our application, we expose it at the root tree.
    return MaterialApp(
      title: LocaleStrings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppConstants.primaryColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(title: LocaleStrings.appTitle),
      // home: LoginScre
      // en(),
    );
  }
}
