import 'package:flutter/material.dart';
import 'package:imgur_gallery/core/ui/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends BaseViewModel> extends StatefulWidget {

  final Widget Function(BuildContext context, T value, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  BaseWidget({
    Key key,
    this.model,
    this.builder,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetState<T>();
  }
}

class _BaseWidgetState<T extends BaseViewModel> extends State<BaseWidget<T>> {

  T model;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
