import 'package:flutter/material.dart';
import 'package:islamicapp/ui/home/tabs/Hadeth/hadeth_tap.dart';
import 'package:islamicapp/ui/home/tabs/Radio/radio_tap.dart';
import 'package:islamicapp/ui/home/tabs/Sebha/sebha_tap.dart';
import 'package:islamicapp/ui/home/tabs/Time/time_tap.dart';
import 'package:islamicapp/ui/home/tabs/quran/quran_tap.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = [
    AppAssets.quranBg,
    AppAssets.hadethBg,
    AppAssets.sebhaBg,
    AppAssets.radioBg,
    AppAssets.timeBg,
  ];
  List<Widget> tabs = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,

              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },

              items: [
                BottomNavigationBarItem(
                  icon: builtBottomNavTap(
                    index: 0,
                    iconName: AppAssets.iconQuran,
                  ),
                  label: "Quran",
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavTap(
                    index: 1,
                    iconName: AppAssets.iconHadeth,
                  ),
                  label: "Hadeth",
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavTap(
                    index: 2,
                    iconName: AppAssets.iconSebha,
                  ),
                  label: "Sebha",
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavTap(
                    index: 3,
                    iconName: AppAssets.iconRadio,
                  ),
                  label: "Radio",
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavTap(
                    index: 4,
                    iconName: AppAssets.iconTime,
                  ),
                  label: "Time",
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Image.asset(
                  AppAssets.logo,
                  height: height * 0.15,
                  width: width * 0.69,
                ),
              ),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget builtBottomNavTap({required int index, required String iconName}) {
    return selectedIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: AppColors.blackBgColor,
            ),
            child: ImageIcon(AssetImage(iconName)),
          )
        : ImageIcon(AssetImage(iconName));
  }
}
