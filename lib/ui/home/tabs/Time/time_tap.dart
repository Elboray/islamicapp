import 'package:flutter/material.dart';
import 'package:islamicapp/ui/home/tabs/Time/widget/azkar_card.dart';
import 'package:islamicapp/ui/home/tabs/Time/widget/time_item.dart';
import 'package:islamicapp/utils/app_styles.dart';

class TimeTap extends StatelessWidget {
  const TimeTap({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const TimeItem(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Text("Azkar", style: AppStyles.bold30white),
          ),
          const AzkarCard(),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
