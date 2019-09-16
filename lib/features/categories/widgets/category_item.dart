import 'package:flutter/material.dart';

class SelectableItem<T> extends StatelessWidget {
  final T item;
  final Widget foreground;
  final Widget foregroundSelected;
  final Widget background;
  final bool isSelected;
  final Function(T) onTap;

  SelectableItem({
    @required this.foreground,
    @required this.foregroundSelected,
    @required this.background,
    @required this.item,
    @required this.isSelected,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => onTap(item),
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: background,
          ),
          AnimatedContainer(
            width: isSelected ? 0 : width,
            height: isSelected ? 0 : height,
            alignment: Alignment.center,
            duration: Duration(milliseconds: 200),
            color: isSelected ? Colors.transparent : Colors.white,
          ),
          Align(
            alignment: Alignment.center,
            child: isSelected ? foregroundSelected : foreground,
          ),
        ]),
      ),
    );
  }
}
