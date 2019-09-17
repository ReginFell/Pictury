import 'dart:async';

import 'package:bloc/bloc.dart';

abstract class BaseBloc<VS, E> extends Bloc<E, VS> {
  final List<StreamSubscription> _subscription = [];

  @override
  void dispose() {
    super.dispose();
    _subscription.forEach((subscription) => subscription.cancel());
  }
}
