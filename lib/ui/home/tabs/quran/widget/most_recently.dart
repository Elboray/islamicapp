import 'package:flutter/material.dart';
import 'package:islamicapp/provider/most_recent_provider.dart';
import 'package:islamicapp/utils/app_routes.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_styles.dart';
import '../quran_resources.dart';

class MostRecently extends StatefulWidget {
  const MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostRecentProvider.readMostRecentList();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> filterList = List.generate(114, (index) => index);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecent.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Most Recently", style: AppStyles.bold16white),
          SizedBox(height: height * 0.01),
          SizedBox(
            height: height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.quranDetailsRouteName,
                      arguments: mostRecentProvider.mostRecent[index],
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QuranResources
                                  .englishQuranSuraList[mostRecentProvider
                                  .mostRecent[index]],
                              style: AppStyles.bold24black,
                            ),
                            Text(
                              QuranResources
                                  .arabicQuranSuraList[mostRecentProvider
                                  .mostRecent[index]],
                              style: AppStyles.bold24black,
                            ),
                            Text(
                              QuranResources.versesNumberList[mostRecentProvider
                                  .mostRecent[index]],
                              style: AppStyles.bold14black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.mostRecently),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.04),
              itemCount: mostRecentProvider.mostRecent.length,
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
