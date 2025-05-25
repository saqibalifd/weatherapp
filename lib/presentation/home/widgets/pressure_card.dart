import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_fonts.dart';

import '../../../constants/app_colors.dart';

class PressureCard extends StatelessWidget {
  const PressureCard({super.key});

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
                'PRESSURE',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: AppFonts.sfProDisplay,
                  fontWeight: AppFonts.regular,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
