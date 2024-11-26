import 'package:flutter_bloc/flutter_bloc.dart';

class myBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print('onChange');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError');
  }

  @override
  void onClose(BlocBase bloc) {
    print('bloc is closed');
  }

  @override
  void onCreate(BlocBase bloc) {
    print('onCreate');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('onEvent');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(
      'onTransition',
    );
  }
}
