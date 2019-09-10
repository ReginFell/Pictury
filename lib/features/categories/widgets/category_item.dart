import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pictury/data/remote_config/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final Function(Category) onTap;

  CategoryItem({
    @required this.category,
    @required this.isSelected,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () => onTap(category),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: category.picture,
                    fit: BoxFit.cover,
                  )),
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
                child: Text(category.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle
                        .copyWith(color: Colors.white)),
              )
            ]),
          ),
        ));
  }
}
