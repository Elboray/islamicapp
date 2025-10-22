import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicapp/provider/most_recent_provider.dart';
import 'package:islamicapp/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamicapp/ui/home/tabs/quran/widget/sura_content.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_colors.dart';
import 'package:islamicapp/utils/app_styles.dart';
import 'package:provider/provider.dart';

class QuranDetails extends StatefulWidget {
  QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;

  @override
  void dispose() {
    mostRecentProvider.readMostRecentList();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    if (verses.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranSuraList[index],
          style: AppStyles.bold20primary,
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
              Text(
                QuranResources.arabicQuranSuraList[index],
                style: AppStyles.bold24primary,
              ),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.only(top: height * 0.04),
                        itemBuilder: (context, index) {
                          return SuraContent(
                            content: verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.02);
                        },
                        itemCount: verses.length,
                      ),
              ),
              SizedBox(height: height * 0.10),
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/quran/${index + 1}.txt',
    );
    List<String> suraContent = fileContent.split("\n");
    verses = suraContent;
    setState(() {});
  }
}
