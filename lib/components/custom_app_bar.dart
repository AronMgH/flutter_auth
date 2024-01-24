import 'package:flt_challenge/constants/app_constants.dart';
import 'package:flutter/material.dart';

class FAppBar extends StatelessWidget {
  // final Widget leading;
  final String header;
  final String description;

  const FAppBar({super.key, required this.header, required this.description});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    double headerFontSize = 36;
    double responsivePadding = screen.width * 0.05;
    if (orientation == Orientation.landscape) {
      responsivePadding = screen.width * 0.02;
      headerFontSize = 24;
    }
    return Container(
      alignment: Alignment.bottomLeft,
      padding: EdgeInsets.all(responsivePadding),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            AppConstants.darkBlue,
            AppConstants.darkerBlue,
            AppConstants.darkestBlue
          ])),
      // color: AppConstants.darkBlue,
      child: orientation == Orientation.portrait
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppConstants.light,
                    )),
                const Spacer(),
                Text(
                  header,
                  style: TextStyle(
                      fontSize: headerFontSize,
                      color: AppConstants.light,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: headerFontSize / 2, color: AppConstants.grey),
                ),
                // const SizedBox(height: 24),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppConstants.light,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      header,
                      style: TextStyle(
                          fontSize: headerFontSize,
                          color: AppConstants.light,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                          fontSize: headerFontSize / 2,
                          color: AppConstants.grey),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
