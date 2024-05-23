import 'package:bookstore/src/logic/navigation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseLogic<T> extends StateNotifier<T> {
  final Reader read;

  BaseLogic(this.read, T state) : super(state);

  NavigationLogic get navigation => read(navigationLogic.notifier);

  Future<void> initialize();
}
