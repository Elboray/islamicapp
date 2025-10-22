import 'package:flutter/material.dart';
import 'package:islamicapp/utils/app_colors.dart';
import 'package:islamicapp/utils/app_styles.dart';

class SuraContent extends StatelessWidget {
  final String content;
  final int index;

  const SuraContent({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 1),
      ),
      child: Text(
        '$content[${index + 1}]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyles.bold20primary,
      ),
    );
  }
}
