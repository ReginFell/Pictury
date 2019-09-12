import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class SelectableItem<T> extends StatelessWidget {
  final T item;
  final Widget foreground;
  final Widget background;
  final bool isSelected;
  final Function(T) onTap;

  SelectableItem({
    @required this.foreground,
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
          padding: EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: background),
              AnimatedContainer(
                width: isSelected ? width : 0,
                height: isSelected ? height : 0,
                alignment: Alignment.center,
                duration: Duration(milliseconds: 200),
                color: isSelected
                    ? Theme.of(context).primaryColorDark
                    : Colors.transparent,
              ),
              Align(
                alignment: Alignment.center,
                child: foreground),
            ]),
          ),
        ));
  }
}
