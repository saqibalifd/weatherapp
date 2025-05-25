import 'package:flutter/material.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class WindCard extends StatelessWidget {
  const WindCard({super.key});

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
              Icon(
                Icons.home,
                color: AppColors.grey,
              ),
              Text(
                'WIND',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.sfProDisplay,
                  fontWeight: AppFonts.regular,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: context.screenHeight * .01,
          // ),
          // Text(
          //   '4',
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontFamily: AppFonts.sfProDisplay,
          //     fontWeight: AppFonts.regular,
          //     color: AppColors.background,
          //   ),
          // ),
          // Text(
          //   'Moderate',
          //   style: TextStyle(
          //     fontSize: 20,
          //     fontFamily: AppFonts.sfProDisplay,
          //     fontWeight: AppFonts.regular,
          //     color: AppColors.background,
          //   ),
          // ),
          // SizedBox(
          //   height: context.screenHeight * .01,
          // ),
          // Divider(
          //   color: AppColors.electricPurple,
          // )
        ],
      ),
    );
  }
}
