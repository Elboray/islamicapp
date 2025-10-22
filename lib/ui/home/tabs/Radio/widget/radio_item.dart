import 'package:flutter/material.dart';
import 'package:islamicapp/utils/app_colors.dart';
import 'package:islamicapp/utils/app_styles.dart';

class RadioItem extends StatefulWidget {
  String image;
  String title;

  RadioItem({super.key, required this.image, required this.title});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              alignment: Alignment.bottomCenter,
              widget.image,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: AppStyles.bold20black,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow,
                      color: AppColors.blackColor,
                      size: 55,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_up_outlined,
                      color: AppColors.blackColor,
                      size: 44,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
