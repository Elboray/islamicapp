import 'package:flutter/material.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_styles.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap>
    with SingleTickerProviderStateMixin {
  int _count = 0;
  int _currentIndex = 0;
  late AnimationController _controller;

  final List<String> _azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
  ];

  final List<String> _verses = [
    "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
    "فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ",
    "وَكَبِّرْهُ تَكْبِيرًا",
    "شَهِدَ اللَّهُ أَنَّهُ لَا إِلَٰهَ إِلَّا هُوَ",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    _controller.forward(from: 0);
    setState(() {
      if (_count >= 33) {
        _count = 0;
        _currentIndex++;
        if (_currentIndex >= _azkar.length) {
          _currentIndex = 0;
        }
      }
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: height * 0.04),
        Text(_verses[_currentIndex], style: AppStyles.bold36white),
        SizedBox(height: height * 0.04),
        GestureDetector(
          onTap: _onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: Image.asset(AppAssets.sebha, width: width * 0.8),
              ),
              Column(
                children: [
                  SizedBox(height: height * 0.1),
                  Text(_azkar[_currentIndex], style: AppStyles.bold36white),
                  SizedBox(height: height * 0.04),
                  Text('$_count', style: AppStyles.bold36white),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
