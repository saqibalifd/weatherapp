import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weatherapp/constants/app_colors.dart';
import 'package:weatherapp/constants/app_icons.dart';
import 'package:weatherapp/constants/app_images.dart';
import 'package:weatherapp/extension/mediaquery_extension.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final VoidCallback onLocationTap;
  final VoidCallback onPlusTap;
  final VoidCallback onListTap;
  const BottomNavigationBarWidget({
    super.key,
    required this.onLocationTap,
    required this.onPlusTap,
    required this.onListTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child: Stack(
          children: [
            Image.asset(AppImages.bottomNavBarBackground),
            SizedBox(
              width: context.screenWidth * 1,
              child: Padding(
                padding: EdgeInsets.only(
                    top: context.screenHeight * .03,
                    left: context.screenWidth * .07,
                    right: context.screenWidth * .07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: onLocationTap,
                        child: SvgPicture.asset(AppIcons.location)),
                    Padding(
                      padding: EdgeInsets.only(left: context.screenWidth * .1),
                      child: GestureDetector(
                        onTap: onPlusTap,
                        child: CircleAvatar(
                            backgroundColor: AppColors.background,
                            radius: 30,
                            child: SvgPicture.asset(
                              AppIcons.plus,
                              color: AppColors.charocalIndigo,
                            )),
                      ),
                    ),
                    GestureDetector(
                        onTap: onListTap,
                        child: SvgPicture.asset(AppIcons.list)),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
