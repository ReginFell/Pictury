import 'package:flutter/cupertino.dart';

class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  KeepAliveWidget(this.child);

  @override
  State<StatefulWidget> createState() {
    return _KeepAliveWidgetState();
  }
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin<KeepAliveWidget> {
  @override
  Widget build(BuildContext context) {
    final Widget cached = super.build(context);
    if (cached == null) {
      return widget.child;
    } else {
      return cached;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
