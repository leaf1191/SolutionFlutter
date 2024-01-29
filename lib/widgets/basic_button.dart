import 'package:flutter/material.dart';

class BasicButton extends StatelessWidget {
  const BasicButton(
      {Key? key,
      double this.width = 1,
      double this.height = 1,
      Color this.color = const Color(0xFF000000),
      Widget? this.child,
      double this.circular = 20})
      : super(key: key);
  final width;
  final height;
  final color;
  final child;
  final circular;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(circular),
        border: Border.all(color: color,width: 2),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 3
          )
        ]
      ),
      child: child,
    );
  }
}
