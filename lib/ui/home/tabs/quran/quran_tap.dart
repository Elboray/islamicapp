import 'package:flutter/material.dart';
import 'package:islamicapp/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamicapp/ui/home/tabs/quran/widget/most_recently.dart';
import 'package:islamicapp/ui/home/tabs/quran/widget/sura_item.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_routes.dart';
import 'package:islamicapp/utils/app_styles.dart';
import 'package:islamicapp/utils/shared_pres_helper.dart';

import '../../../../utils/app_colors.dart';

class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppStyles.bold16white,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: builtTextFieldBorder(),
              focusedBorder: builtTextFieldBorder(),
              prefixIcon: Image.asset(AppAssets.iconSearch),
              hintText: "Sura Name",
              hintStyle: AppStyles.bold16white,
            ),
            onChanged: (newText) {
              searchByNewText(newText);
            },
          ),
          SizedBox(height: height * 0.02),
          MostRecently(),
          Text("Suras List", style: AppStyles.bold16white),
          SizedBox(height: height * 0.02),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveLastSuraIndex(filterList[index]);
                    Navigator.of(context).pushNamed(
                      AppRoutes.quranDetailsRouteName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.whiteColor,
                  indent: width * 0.10,
                  endIndent: width * 0.10,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder builtTextFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
    );
  }

  void searchByNewText(String newText) {
    List<int> searchResultText = [];
    for (int i = 0; i < QuranResources.englishQuranSuraList.length; i++) {
      if (QuranResources.englishQuranSuraList[i].toLowerCase().contains(
        newText.toLowerCase(),
      )) {
        searchResultText.add(i);
      }
      if (QuranResources.arabicQuranSuraList[i].contains(newText)) {
        searchResultText.add(i);
      }
    }
    filterList = searchResultText;
    setState(() {});
  }
}
