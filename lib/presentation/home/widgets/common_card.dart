import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_fonts.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

import '../../../constants/app_colors.dart';

class CommonCard extends StatelessWidget {
  final IconData iconPath;
  final String name;
  final String title;
  final String? body;
  final String subtitle;

  const CommonCard(
      {super.key,
      required this.iconPath,
      required this.name,
      required this.title,
      this.body,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth * .02,
          vertical: context.screenHeight * .01),
      child: Container(
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
                  iconPath,
                  color: AppColors.grey,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: AppFonts.sfProDisplay,
                    fontWeight: AppFonts.regular,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.screenHeight * .01,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontFamily: AppFonts.sfProDisplay,
                fontWeight: AppFonts.regular,
                color: AppColors.background,
              ),
            ),
            Text(
              body ?? '',
              style: TextStyle(
                fontSize: 17,
                fontFamily: AppFonts.sfProDisplay,
                fontWeight: AppFonts.regular,
                color: AppColors.background,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                fontFamily: AppFonts.sfProDisplay,
                fontWeight: AppFonts.regular,
                color: AppColors.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
