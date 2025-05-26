import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_colors.dart';

class PressureCard extends StatelessWidget {
  final double progress;
  const PressureCard({super.key, required this.progress});

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
                AppIcons.pressure,
                colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: context.screenHeight * .02,
                width: context.screenWidth * .02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'PRESSURE',
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
          SizedBox(
            height: context.screenHeight * .01,
          ),
          CircularSeekBar(
            width: double.infinity,
            height: context.screenHeight * .13,
            progress: progress,
            barWidth: 8,
            startAngle: 45,
            sweepAngle: 360,
            strokeCap: StrokeCap.butt,
            progressGradientColors: [
              AppColors.grey,
              AppColors.lightSecondary,
              AppColors.lightQuantiary,
              AppColors.lightTeritiary,
              AppColors.lightQuantiary,
              AppColors.lightSecondary,
              AppColors.grey,
            ],
            dashWidth: 2,
            dashGap: 6,
            animation: true,
          )
        ],
      ),
    );
  }
}
