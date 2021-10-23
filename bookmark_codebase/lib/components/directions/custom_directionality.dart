import 'package:flutter/material.dart';

class RTLDirection extends StatelessWidget {
  final Widget child;
  const RTLDirection({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: child);
  }
}
