import 'package:flutter/material.dart';

class SelectableItem<T> extends StatelessWidget {
  final T item;
  final Widget selected;
  final Widget notSelected;
  final bool isSelected;
  final Function(T) onTap;

  SelectableItem({
    Key key,
    @required this.selected,
    @required this.notSelected,
    @required this.item,
    @required this.isSelected,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(item),
      child: Padding(
        padding: EdgeInsets.all(3.0),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          transitionBuilder: (child, animation) {
            if (isSelected) {
              return ScaleTransition(
                scale: animation,
                child: child,
              );
            } else {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
          },
          child: isSelected
              ? Container(key: ValueKey(item), child: selected)
              : Container(key: ValueKey(item), child: notSelected),
        ),
      ),
    );
  }
}
