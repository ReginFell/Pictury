import 'package:flutter/cupertino.dart';

class PagingView extends StatefulWidget {
  final Scrollable _scrollable;

  PagingView(this._scrollable);

  @override
  State<StatefulWidget> createState() => _PagingViewState();
}

class _PagingViewState extends State<PagingView> {

  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
   return widget._scrollable.li
  }
}
