import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/extension/cutom_linear_progress.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_fonts.dart';

class UvIndexCard extends StatelessWidget {
  final double uvIndex;
  const UvIndexCard({super.key, required this.uvIndex});

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
                AppIcons.uvindex,
                colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
                height: context.screenHeight * .02,
                width: context.screenWidth * .02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  'UV INDEX',
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
          Text(
            '4',
            style: TextStyle(
              fontSize: 24,
              fontFamily: AppFonts.sfProDisplay,
              fontWeight: AppFonts.regular,
              color: AppColors.background,
            ),
          ),
          Text(
            'Moderate',
            style: TextStyle(
              fontSize: 20,
              fontFamily: AppFonts.sfProDisplay,
              fontWeight: AppFonts.regular,
              color: AppColors.background,
            ),
          ),
          SizedBox(
            height: context.screenHeight * .01,
          ),
          CutomLinearProgress(percentage: uvIndex)
        ],
      ),
    );
  }
}
