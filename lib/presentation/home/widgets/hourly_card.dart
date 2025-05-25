import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class HourlyCard extends StatelessWidget {
  final String time;
  final int temprature;
  final int rainChances;
  final bool isNow;

  const HourlyCard({
    super.key,
    required this.time,
    required this.temprature,
    required this.rainChances,
    required this.isNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isNow ? AppColors.purpleNavy : AppColors.rebeccaPurple,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: AppColors.background.withValues(alpha: .2),
            offset: const Offset(-2, -2),
            blurRadius: .3,
          ),
          BoxShadow(
            color: AppColors.lightPrimary.withValues(alpha: .2),
            offset: const Offset(2, 2),
            blurRadius: .3,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.screenHeight * .03,
            horizontal: context.screenWidth * .02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFonts.sfProDisplay,
                  fontWeight: AppFonts.regular,
                  color: AppColors.background),
            ),
            Padding(
                padding:
                    EdgeInsets.symmetric(vertical: context.screenHeight * .01),
                child: Stack(
                  children: [
                    Image.asset(
                      rainChances >= 100
                          ? AppIcons.moonCloudMidRainWindSmall
                          : rainChances <= 50
                              ? AppIcons.sunCloudMidRainSmall
                              : rainChances <= 20
                                  ? AppIcons.moonCloudFastWingSmall
                                  : AppIcons.moonCloudMidRainWindSmall,
                      height: context.screenHeight * .09,
                      width: context.screenWidth * .09,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.screenHeight * .065,
                          left: context.screenWidth * .01),
                      child: Text(
                        '$rainChances%'.toString(),
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: AppFonts.sfProDisplay,
                            fontWeight: AppFonts.regular,
                            color: AppColors.skyBlue),
                      ),
                    )
                  ],
                )),
            Text(
              '$temprature°'.toString(),
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFonts.sfProDisplay,
                  fontWeight: AppFonts.regular,
                  color: AppColors.background),
            )
          ],
        ),
      ),
    );
  }
}
