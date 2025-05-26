import 'package:flutter/material.dart';

class CurvedProgressBar extends StatelessWidget {
  final double value;
  final double size;

  const CurvedProgressBar({Key? key, required this.value, this.size = 25})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvedProgressPainter(progress: value),
      child: SizedBox(height: size, width: double.infinity),
    );
  }
}

class CurvedProgressPainter extends CustomPainter {
  final double progress;

  CurvedProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint curvePaint = Paint()
      ..color = Colors.blue.shade100
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    final Paint trackPaint = Paint()
      ..color = Colors.grey.shade400
      ..strokeWidth = 1;

    final path = Path();

    final double maxHeight = size.height;

    path.moveTo(0, maxHeight);
    for (double x = 0; x <= size.width; x++) {
      // Parabolic curve: y = a(x - h)^2 + k
      // Here, the peak is at center (h = width/2, k = 0)
      double normalizedX = (x / size.width) * 2 - 1; // range: -1 to 1
      double y = maxHeight - (1 - normalizedX * normalizedX) * maxHeight;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, curvePaint);

    // Draw horizontal baseline at the bottom
    canvas.drawLine(
      Offset(0, maxHeight),
      Offset(size.width, maxHeight),
      trackPaint,
    );

    // Dot position
    double dx = progress.clamp(0.0, 1.0) * size.width;
    double normalizedDx = (dx / size.width) * 2 - 1;
    double dy = maxHeight - (1 - normalizedDx * normalizedDx) * maxHeight;

    final Paint dotPaint = Paint()
      ..color = Colors.purpleAccent
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawCircle(Offset(dx, dy), 8, dotPaint);
    canvas.drawCircle(Offset(dx, dy), 6, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CurvedProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
