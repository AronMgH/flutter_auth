import 'package:flt_challenge/constants/app_constants.dart';
import 'package:flutter/material.dart';

class FAppBar extends StatelessWidget {
  // final Widget leading;
  final String header;
  final String description;

  const FAppBar({super.key, required this.header, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 24, right: 24,top: 24, bottom: 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [AppConstants.darkBlue, AppConstants.darkerBlue, AppConstants.darkestBlue])
      ),
      // color: AppConstants.darkBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios, color: AppConstants.light,)),
          const SizedBox(height: 24),
          Text(header, style: const TextStyle(fontSize: 36, color: AppConstants.light, fontWeight: FontWeight.w900),),
          Text(description, style: const TextStyle(fontSize: 16, color: AppConstants.grey),)
        ],
      ),
    );
  }
}