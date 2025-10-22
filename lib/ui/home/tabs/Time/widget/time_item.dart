import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islamicapp/ui/home/tabs/Time/widget/build_prayer_card.dart';
import 'package:islamicapp/utils/app_assets.dart';

import '../../../../../utils/app_styles.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({super.key});

  static List<Map<String, String>> _getPrayers() {
    return [
      {"name": "Fajr", "time": "04:04", "period": "AM", "active": "false"},
      {"name": "Duhr", "time": "01:01", "period": "PM", "active": "false"},
      {"name": "ASR", "time": "04:38", "period": "PM", "active": "true"},
      {"name": "Maghrib", "time": "07:57", "period": "PM", "active": "false"},
      {"name": "Isha", "time": "09:13", "period": "PM", "active": "false"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.9,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: height * 0.32,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(AppAssets.prayTimeBg, fit: BoxFit.fill),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "16 Jul,",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "2024",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "Pray Time",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Tuesday",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "09 Muh,",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "1446",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: height * 0.11,
                        enlargeCenterPage: true,
                        viewportFraction: 0.3,
                      ),
                      items: _getPrayers().map((prayer) {
                        return BuildPrayerCard(
                          name: prayer['name']!,
                          time: prayer['time']!,
                          period: prayer['period']!,
                          isActive: prayer['active'] == 'true',
                        );
                      }).toList(),
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Next Pray - ", style: AppStyles.bold16black),
                        Text("02:32", style: AppStyles.bold16black),
                        SizedBox(width: width * 0.02),
                        Icon(Icons.volume_off, color: Colors.black87, size: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
