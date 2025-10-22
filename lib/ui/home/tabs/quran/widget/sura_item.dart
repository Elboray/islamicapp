import 'package:flutter/material.dart';
import 'package:islamicapp/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  final int index;

  const SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.starVector),
            Text("${index + 1}", style: AppStyles.bold14white),
          ],
        ),
        SizedBox(width: width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              QuranResources.englishQuranSuraList[index],
              style: AppStyles.bold20white,
            ),
            Text(
              QuranResources.versesNumberList[index],
              style: AppStyles.bold14white,
            ),
          ],
        ),
        Spacer(),
        Text(
          QuranResources.arabicQuranSuraList[index],
          style: AppStyles.bold20white,
        ),
      ],
    );
  }
}
