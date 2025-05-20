import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';

class GlassmorphismWidget extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;
  final double borderRadius;
  final Color color;
  final LinearGradient? gradient;

  const GlassmorphismWidget({
    Key? key,
    required this.child,
    this.blur = 5,
    this.opacity = 0.2,
    this.borderRadius = 20,
    this.color = Colors.white,
    this.gradient,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: color.withValues(alpha: opacity),
            gradient: AppColors.gradienThree,
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: Border.all(
              width: 1.5,
              color: color.withValues(alpha: .2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
