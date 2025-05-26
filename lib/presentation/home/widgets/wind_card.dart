import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class WindCard extends StatelessWidget {
  final String windSpeed;
  const WindCard({super.key, required this.windSpeed});

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
                AppIcons.wind,
                colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: context.screenHeight * .02,
                width: context.screenWidth * .02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'WIND',
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
          Container(
            height: context.screenHeight * .13,
            child: Stack(
              children: [
                CircularSeekBar(
                  width: double.infinity,
                  height: context.screenHeight * .13,
                  progress: .0,
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
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: context.screenWidth * .08),
                    child: Text(
                      'W',
                      style: TextStyle(
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: context.screenWidth * .08),
                    child: Text(
                      'E',
                      style: TextStyle(
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: context.screenHeight * .09),
                    child: Text(
                      'N',
                      style: TextStyle(
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: context.screenHeight * .09),
                    child: Text(
                      'S',
                      style: TextStyle(
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    '${windSpeed}\n km/h',
                    style: TextStyle(
                        color: AppColors.background,
                        fontFamily: AppFonts.sfProDisplay,
                        fontWeight: AppFonts.bold,
                        fontSize: 10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
