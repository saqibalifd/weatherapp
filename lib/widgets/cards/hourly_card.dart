import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class HourlyCard extends StatelessWidget {
  final String time;
  final String svgIconPath;
  final String temprature;
  final Color? color;
  const HourlyCard({
    super.key,
    required this.time,
    required this.svgIconPath,
    required this.temprature,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.rebeccaPurple,
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
                child: SvgPicture.asset(svgIconPath)),
            Text(
              temprature,
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
