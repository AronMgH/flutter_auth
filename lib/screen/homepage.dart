import 'package:flt_challenge/bloc/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flt_challenge/screen/change-password/change_password.dart';
import 'package:flt_challenge/screen/login/login.dart';
import 'package:flt_challenge/screen/register/register.dart';
import 'package:provider/provider.dart';

import '../bloc/auth_states.dart';
import '../constants/app_strings.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 220,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const SizedBox(
                height: 42,
              ),
              MenuButton(
                title: LocaleStrings.loginBtn,
                newRoute: (context) => const LoginScreen(),
              ),
              const SizedBox(height: 16),
              authProvider.authState is Unauthenticated
                  ? MenuButton(
                      title: LocaleStrings.registerBtn,
                      newRoute: (context) => const RegisterScreen(),
                    )
                  : const SizedBox(height: 0),
              const SizedBox(height: 16),
              authProvider.authState is Authenticated
                  ? MenuButton(
                      title: LocaleStrings.changePasswordBtn,
                      newRoute: (context) => const ChangeePasswordScreen(),
                    )
                  : const SizedBox(height: 0),
              const SizedBox(height: 16),
              authProvider.authState is Authenticated
                  ? OutlinedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                      onPressed: () => authProvider.logout(),
                      child: Container(
                        width: screen.width * 0.5,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        child: const Text(LocaleStrings.logoutBtn),
                      ),
                    )
                  : const SizedBox(height: 0),
              const Spacer()
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.title, required this.newRoute});

  final String title;
  final Widget Function(BuildContext)? newRoute;
  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      onPressed: () => newRoute != null
          ? Navigator.push(context, MaterialPageRoute(builder: newRoute!))
          : (),
      child: Container(
        width: screen.width * 0.5,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(title),
      ),
    );
  }
}
