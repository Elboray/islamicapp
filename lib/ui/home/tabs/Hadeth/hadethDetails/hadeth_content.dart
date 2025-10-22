import 'package:flutter/material.dart';
import 'package:islamicapp/utils/app_colors.dart';
import 'package:islamicapp/utils/app_styles.dart';

class HadethContent extends StatelessWidget {
  final String content;

  const HadethContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Text(
        content,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyles.bold20primary,
      ),
    );
  }
}
