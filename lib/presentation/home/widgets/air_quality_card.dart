import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_fonts.dart';

class AirQualityCard extends StatelessWidget {
  const AirQualityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * .24,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * .05,
          vertical: context.screenWidth * .05),
      margin: EdgeInsets.symmetric(horizontal: context.screenWidth * .02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.charocalIndigo,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.screenHeight * .02,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.home,
                color: AppColors.grey,
              ),
              Text(
                'AIR QUALITY',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.sfProDisplay,
                  fontWeight: AppFonts.regular,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          Text(
            '3-Low Health Risk',
            style: TextStyle(
              fontSize: 18,
              fontFamily: AppFonts.sfProDisplay,
              fontWeight: AppFonts.regular,
              color: AppColors.background,
            ),
          ),
          Divider(
            color: AppColors.electricPurple,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'See more',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: AppFonts.sfProDisplay,
                  fontWeight: AppFonts.regular,
                  color: AppColors.background,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
