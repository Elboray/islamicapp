import 'package:flutter/material.dart';
import 'package:flutter_advanced_segment/flutter_advanced_segment.dart';
import 'package:islamicapp/ui/home/tabs/Radio/widget/radio_item.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class RadioTap extends StatefulWidget {
  const RadioTap({super.key});

  @override
  State<RadioTap> createState() => _RadioTapState();
}

class _RadioTapState extends State<RadioTap> {
  final _controller = ValueNotifier('Radio');
  final List<String> images = [AppAssets.audioBg, AppAssets.mosqueHadeth];

  final List<String> titles = [
    "Radio Ibrahim Al-Akdar",
    "Radio Mishary Alafasy",
    "Radio Abdul Basit",
    "Radio Al-Sudais",
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.9,
          height: height * 0.05,
          child: AdvancedSegment<String, String>(
            controller: _controller,
            segments: const {'Radio': 'Radio', 'Reciters': 'Reciters'},
            activeStyle: AppStyles.bold16black,
            inactiveStyle: AppStyles.bold16white,
            backgroundColor: AppColors.blackBgColor,
            sliderColor: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            animationDuration: const Duration(milliseconds: 250),
          ),
        ),
        SizedBox(height: height * 0.02),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final image = images[index % images.length];
              final title = titles[index % titles.length];
              return RadioItem(title: title, image: image);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: height * 0.02);
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
