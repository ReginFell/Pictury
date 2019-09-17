import 'dart:async';

import 'package:bloc/bloc.dart';

abstract class BaseBloc<VS, E> extends Bloc<E, VS> {
  final List<StreamSubscription> subscriptions = [];

  @override
  void dispose() {
    super.dispose();
    subscriptions.forEach((subscription) => subscription.cancel());
  }
}
