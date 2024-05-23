import 'package:bookstore/src/model/state/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationLogic = ChangeNotifierProvider<NavigationLogic>((ref) => NavigationLogic(ref.read));

class NavigationLogic extends ChangeNotifier {
  final Reader read;

  NavigationState state = NavigationState();

  NavigationLogic(this.read);

  void navigateRootTo(RootPage page, {Map<String, dynamic>? argument}) {
    state = state.copyWith(root: page, argument: argument ?? {});
    notifyListeners();
  }

  void change(NavigationState newState) {
    state = newState;
    notifyListeners();
  }

  void navigateMobileMenuTo(MenuPage page) {
    state = state.copyWith(menu: page);
    notifyListeners();
  }

  void menuOnTap(int index) {
    switch (index) {
      case 0:
        navigateMobileMenuTo(MenuPage.books);
        break;
      case 1:
        navigateMobileMenuTo(MenuPage.authors);
        break;
      case 2:
        navigateMobileMenuTo(MenuPage.settings);
        break;
      default:
        navigateMobileMenuTo(MenuPage.books);
    }
  }

  int getIndexByMenu(MenuPage page) {
    int index = 0;
    switch (page) {
      case MenuPage.books:
        index = 0;
        break;
      case MenuPage.authors:
        index = 1;
        break;
      case MenuPage.settings:
        index = 2;
        break;
      default:
        index = 0;
    }
    return index;
  }

  void push(MobileScreen page, {String id = "", Map<String, dynamic> argument = const {}}) {
    if (state.screens == null) {
      state = state.copyWith(screens: StackList<MobileScreen>());
    }
    state.screens?.push(page);
    state = state.copyWith(id: id, argument: argument.isEmpty ? state.argument : argument);
    notifyListeners();
  }

  MobileScreen pop() {
    final page = state.screens?.pop();
    notifyListeners();
    return page ?? MobileScreen.none;
  }

  void clearStack() => state.screens?.clearStack();

  MobileScreen peak() => state.screens?.peak() ?? MobileScreen.none;

  bool canPop() => state.screens?.canPop() ?? false;
}
