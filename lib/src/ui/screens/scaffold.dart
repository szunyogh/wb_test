import 'package:bookstore/helper/custom_rout.dart';
import 'package:bookstore/src/logic/app.dart';
import 'package:bookstore/src/logic/navigation.dart';
import 'package:bookstore/src/model/state/navigation.dart';
import 'package:bookstore/src/ui/screens/authors.dart';
import 'package:bookstore/src/ui/screens/books.dart';
import 'package:bookstore/src/ui/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Menu extends ConsumerStatefulWidget {
  const Menu({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MenuState();
}

class _MenuState extends ConsumerState<Menu> {
  late MenuRouterDelegate routerDelegate;
  late ChildBackButtonDispatcher backButtonDispatcher;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    routerDelegate = MenuRouterDelegate();
    ref.read(appLogic.notifier).initialize();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Defer back button dispatching to the child router
    if (Router.of(context).backButtonDispatcher != null) {
      backButtonDispatcher = Router.of(context).backButtonDispatcher!.createChildBackButtonDispatcher();
    }
  }

  @override
  Widget build(BuildContext context) {
    final logic = ref.read(navigationLogic.notifier);
    final menu = ref.watch(navigationLogic).state.menu;
    final index = logic.getIndexByMenu(menu);
    return Scaffold(
      body: Router(
        routerDelegate: routerDelegate,
        backButtonDispatcher: backButtonDispatcher,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => logic.menuOnTap(index),
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Authors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class MenuRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MenuRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(navigationLogic).state.menu;
        return Navigator(
          key: navigatorKey,
          pages: [
            if (state == MenuPage.books)
              const SimplePage<BooksScreen>(BooksScreen())
            else if (state == MenuPage.authors)
              const SimplePage<AuthorsScreen>(AuthorsScreen())
            else if (state == MenuPage.settings)
              const SimplePage<SettingsScreen>(SettingsScreen())
            else
              SimplePage(
                Scaffold(
                  body: Center(
                    child: Text(
                      'Error',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
          ],
          onPopPage: (route, result) {
            return route.didPop(result);
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    assert(false);
  }
}
