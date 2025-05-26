import 'package:flutter/material.dart';
import 'package:weatherapp/constants/app_colors.dart';

class CutomLinearProgress extends StatelessWidget {
  final double percentage;
  final double height;

  const CutomLinearProgress({
    Key? key,
    required this.percentage,
    this.height = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, height + 16),
      painter: HealthRiskPainter(percentage: percentage, height: height),
    );
  }
}

class HealthRiskPainter extends CustomPainter {
  final double percentage;
  final double height;

  HealthRiskPainter({required this.percentage, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    // Background gradient
    final gradient = LinearGradient(
      colors: [
        Color(0xff083072),
        Color(0xffC159EC),
        Colors.red,
      ],
      stops: [0.0, 0.5, 1.0],
    );

    final rect = Rect.fromLTWH(0, 8, size.width, height);
    final paint = Paint()..shader = gradient.createShader(rect);

    // Draw rounded rectangle
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(height / 2));
    canvas.drawRRect(rrect, paint);

    // Draw white dot
    final dotX = size.width * percentage;
    final dotY = 8 + height / 2;

    final dotPaint = Paint()
      ..color = AppColors.background
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = AppColors.lightPrimary.withValues(alpha: .02)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 2);

    // Draw shadow
    canvas.drawCircle(Offset(dotX, dotY + 1), 2, shadowPaint);

    // Draw dot
    canvas.drawCircle(Offset(dotX, dotY), 2, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
