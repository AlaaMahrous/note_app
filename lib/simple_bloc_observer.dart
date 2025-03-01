import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('change: $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('change: closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('change: created');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('error: $error');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    debugPrint('event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint('transition: $transition');
  }
}
