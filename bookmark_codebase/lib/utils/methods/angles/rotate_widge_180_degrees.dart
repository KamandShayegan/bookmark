import 'package:flutter/material.dart';
import 'dart:math' as math;

class Rotator180 extends StatelessWidget {
  final Widget child;
  const Rotator180({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 180 * math.pi / 180,
      child: child,
    );
  }
}
