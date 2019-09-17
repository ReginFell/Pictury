import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  static const double borderLineSize = 2;
  static const double bottomBarSize = 50 + borderLineSize;

  final Widget child;
  final Color color;

  BottomBar({@required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: bottomBarSize,
      child: Column(
        children: [
          Container(color: Colors.black, height: borderLineSize),
          Expanded(
            child: child,
          )
        ],
      ),
    );
  }
}