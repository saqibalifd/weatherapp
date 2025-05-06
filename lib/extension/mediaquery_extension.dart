import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;
}
