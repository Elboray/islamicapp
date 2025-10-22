import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamicapp/ui/home/home_screen.dart';
import 'package:islamicapp/utils/app_assets.dart';
import '../../utils/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  Widget _buildImage(
    String assetName, [
    double width = 400,
    double height = 415,
  ]) {
    return Image.asset(
      'assets/images/$assetName',
      width: width,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    );

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
      bodyTextStyle: bodyStyle,
      contentMargin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      imagePadding: EdgeInsets.only(top: 20),
      pageColor: AppColors.blackColor,
    );

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: Image.asset(AppAssets.logo, width: 300),
          ),
          Expanded(
            child: IntroductionScreen(
              key: introKey,
              globalBackgroundColor: AppColors.blackColor,
              showSkipButton: false,
              showBackButton: true,
              back: const Text(
                'Back',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              next: const Text(
                'Next',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              done: const Text(
                'Finish',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
              onDone: () => _onIntroEnd(context),
              dotsDecorator: const DotsDecorator(
                size: Size(10.0, 10.0),
                color: Color(0xFF707070),
                activeColor: AppColors.primaryColor,
                activeSize: Size(22.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              pages: [
                PageViewModel(
                  title: "Welcome To Islami App",
                  body: "",
                  image: _buildImage('backgroundImage1.png'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Welcome To Islami",
                  body: "We Are Very Excited To Have You In Our Community",
                  image: _buildImage('backgroundImage2.png'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Reading the Quran",
                  body: "Read, and your Lord is the Most Generous",
                  image: _buildImage('backgroundImage3.png'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Bearish",
                  body: "Praise the name of your Lord, the Most High",
                  image: _buildImage('backgroundImage4.png'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Holy Quran Radio",
                  body:
                      "You can listen to the Holy Quran Radio through the application for free and easily",
                  image: _buildImage('backgroundImage5.png'),
                  decoration: pageDecoration,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
