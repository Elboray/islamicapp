import 'package:flutter/material.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_colors.dart';
import 'package:islamicapp/utils/app_styles.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.blackBgColor,
              border: Border.all(color: AppColors.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.azkarHelalBg,
                  width: width * 0.43,
                  height: height * 0.27,
                ),

                const SizedBox(height: 12),
                Text('Evening Azkar', style: AppStyles.bold20white),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.blackBgColor,
              border: Border.all(color: AppColors.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.azkarHelalBg,
                  width: width * 0.43,
                  height: height * 0.27,
                ),

                const SizedBox(height: 12),
                Text('Evening Azkar', style: AppStyles.bold20white),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.blackBgColor,
              border: Border.all(color: AppColors.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.azkarHelalBg,
                  width: width * 0.43,
                  height: height * 0.27,
                ),

                const SizedBox(height: 12),
                Text('Evening Azkar', style: AppStyles.bold20white),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.blackBgColor,
              border: Border.all(color: AppColors.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppAssets.azkarHelalBg,
                  width: width * 0.43,
                  height: height * 0.27,
                ),

                const SizedBox(height: 12),
                Text('Evening Azkar', style: AppStyles.bold20white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
