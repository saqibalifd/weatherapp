import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/extension/curved_progress_bar.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class SunriseCard extends StatelessWidget {
  final double sinriseValue;
  const SunriseCard({super.key, required this.sinriseValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
          color: AppColors.charocalIndigo.withValues(alpha: .8),
          border: Border.all(color: AppColors.electricPurple),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.sunrise,
                colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: context.screenHeight * .02,
                width: context.screenWidth * .02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'SUNRISE',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.sfProDisplay,
                    fontWeight: AppFonts.regular,
                    color: AppColors.grey,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '5:28 PM',
            style: TextStyle(
              fontSize: 24,
              fontFamily: AppFonts.sfProDisplay,
              fontWeight: AppFonts.regular,
              color: AppColors.background,
            ),
          ),
          SizedBox(
            height: context.screenHeight * .005,
          ),
          CurvedProgressBar(
            value: sinriseValue,
            size: context.screenHeight * .03,
          ),
          SizedBox(
            height: context.screenHeight * .023,
          ),
          Text(
            'Sunset: 7:25PM',
            style: TextStyle(
              fontSize: 14,
              fontFamily: AppFonts.sfProDisplay,
              fontWeight: AppFonts.regular,
              color: AppColors.background,
            ),
          ),
          SizedBox(
            height: context.screenHeight * .01,
          ),
        ],
      ),
    );
  }
}
