import 'package:flutter/material.dart';
import 'package:weatherapp/animations/floating_animation.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_images.dart';

class CitiesWeatherCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String location;
  final String condition;
  final String icon;
  const CitiesWeatherCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.location,
      required this.condition,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * .27,
      child: Stack(
        children: [
          Center(
            child: Image.asset(AppImages.weatherWidget),
          ),
          Padding(
            padding: EdgeInsets.only(left: context.screenWidth * .55),
            child: FloatingAnimation(
              child: Image.asset(
                icon,
                height: context.screenHeight * .13,
                width: context.screenWidth * .3,
              ),
            ),
          ),
          Positioned(
            top: context.screenHeight * .04,
            left: context.screenWidth * .06,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 70,
                      fontFamily: AppFonts.sfProDisplay,
                      fontWeight: AppFonts.regular,
                      color: AppColors.background),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.sfProDisplay,
                      fontWeight: AppFonts.medium,
                      color: AppColors.grey),
                ),
                Text(
                  location,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.sfProDisplay,
                      fontWeight: AppFonts.regular,
                      color: AppColors.background),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: context.screenHeight * .04,
              right: 30,
              child: Text(
                condition,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: AppFonts.sfProDisplay,
                    fontWeight: AppFonts.regular,
                    color: AppColors.background),
              )),
        ],
      ),
    );
  }
}
