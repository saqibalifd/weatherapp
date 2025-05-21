import 'package:flutter/material.dart';

class GradientUnderlineTabIndicator extends Decoration {
  final Gradient gradient;
  final double width;
  final double height;

  const GradientUnderlineTabIndicator({
    required this.gradient,
    this.width = 2.0,
    this.height = 2.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _GradientUnderlinePainter(this, onChanged);
  }
}

class _GradientUnderlinePainter extends BoxPainter {
  final GradientUnderlineTabIndicator decoration;

  _GradientUnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Offset(
          offset.dx + (configuration.size!.width - decoration.width) / 2,
          offset.dy + configuration.size!.height - decoration.height,
        ) &
        Size(decoration.width, decoration.height);

    final Paint paint = Paint()
      ..shader = decoration.gradient.createShader(rect)
      ..strokeWidth = decoration.height
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);
  }
}
