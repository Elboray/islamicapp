import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicapp/model/hadeth.dart';
import 'package:islamicapp/provider/most_recent_provider.dart';
import 'package:islamicapp/ui/home/tabs/Hadeth/hadethDetails/hadeth_content.dart';
import 'package:islamicapp/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamicapp/ui/home/tabs/quran/widget/sura_content.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_colors.dart';
import 'package:islamicapp/utils/app_styles.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          hadeth.title,
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.blackBgColor,
          image: DecorationImage(
            image: AssetImage(AppAssets.bgSuraDetails),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          child: Column(
            children: [
              Text(hadeth.title, style: AppStyles.bold24primary),
              SizedBox(height: height * 0.04),
              Expanded(
                child: SingleChildScrollView(
                  child: HadethContent(content: hadeth.content),
                ),
              ),
              SizedBox(height: height * 0.10),
            ],
          ),
        ),
      ),
    );
  }
}
