import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamicapp/model/hadeth.dart';
import 'package:islamicapp/utils/app_assets.dart';
import 'package:islamicapp/utils/app_colors.dart';
import 'package:islamicapp/utils/app_routes.dart';
import 'package:islamicapp/utils/app_styles.dart';

class HadethItem extends StatefulWidget {
  final int index;

  HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    loadHadethFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(AppRoutes.hadethDetailsRouteName, arguments: hadeth);
      },
      child: Container(
        padding: EdgeInsets.only(
          right: width * 0.02,
          left: width * 0.02,
          top: width * 0.02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primaryColor,
          image: DecorationImage(image: AssetImage(AppAssets.hadethBgCard)),
        ),
        child: hadeth == null
            ? Center(
                child: CircularProgressIndicator(color: AppColors.blackBgColor),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAssets.imgLeftCorner,
                        color: AppColors.blackColor,
                        width: width * 0.16,
                      ),
                      Expanded(
                        child: Text(
                          hadeth?.title ?? "",
                          textAlign: TextAlign.center,
                          style: AppStyles.bold24black,
                        ),
                      ),
                      Image.asset(
                        AppAssets.imgRightCorner,
                        color: AppColors.blackColor,
                        width: width * 0.16,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        hadeth?.content ?? "",
                        textAlign: TextAlign.center,
                        style: AppStyles.bold16black,
                      ),
                    ),
                  ),
                  Image.asset(
                    AppAssets.mosqueHadeth,
                    color: AppColors.blackColor,
                  ),
                ],
              ),
      ),
    );
  }

  void loadHadethFile() async {
    String fileContent = await rootBundle.loadString(
      'assets/hadeth/h${widget.index}.txt',
    );
    String title = fileContent.substring(0, fileContent.indexOf("\n"));
    String content = fileContent.substring(fileContent.indexOf("\n") + 1);
    hadeth = Hadeth(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
