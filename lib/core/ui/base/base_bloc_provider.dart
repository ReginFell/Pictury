import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc.dart';

class BaseBlocProvider<T extends BaseBloc<VS, dynamic>, VS>
    extends StatefulWidget {
  final Widget Function(BuildContext context, T value) builder;
  final T bloc;
  final Widget child;

  @nullable
  final Function(VS) stateListener;
  final Function(T) onBlocReady;

  BaseBlocProvider({
    Key key,
    this.bloc,
    this.builder,
    this.child,
    this.stateListener,
    this.onBlocReady,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseBlocProviderState<T, VS>();
  }
}

class _BaseBlocProviderState<T extends BaseBloc<VS, dynamic>, VS>
    extends State<BaseBlocProvider<T, VS>> {
  T bloc;

  @override
  void initState() {
    bloc = widget.bloc;
    if (widget.onBlocReady != null) {
      widget.onBlocReady(bloc);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>.value(
        value: bloc,
        child: BlocListener<T, VS>(
          listener: (context, state) {
            if (widget.stateListener != null) {
              widget.stateListener(state);
            }
          },
          child: BlocBuilder<T, VS>(
            builder: (context, state) => widget.builder(context, this.bloc),
          ),
        ));
  }
}
