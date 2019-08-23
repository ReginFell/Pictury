import 'package:flutter/material.dart';

abstract class BaseViewModel<VS> extends ChangeNotifier {
  VS viewState;

  BaseViewModel() {
    viewState = initialViewState();
  }

  VS mutateViewState(Function(VS) mutable) {
    viewState = mutable(viewState);
    notifyListeners();
    return viewState;
  }

  VS initialViewState();
}
