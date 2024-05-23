import 'package:bookstore/helper/custom_rout.dart';
import 'package:bookstore/src/logic/navigation.dart';
import 'package:bookstore/src/model/state/navigation.dart';
import 'package:bookstore/src/ui/screens/scaffold.dart';
import 'package:bookstore/src/ui/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WB Test App',
      debugShowCheckedModeBanner: false,
      routerDelegate: ApplicationRouterDelegate(ref.read),
    );
  }
}

class ApplicationRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationLogic? navigation;

  Reader read;

  ApplicationRouterDelegate(this.read) : navigatorKey = GlobalKey<NavigatorState>() {
    navigation = read(navigationLogic);

    navigation?.addListener(notifyListeners);
  }

  @override
  NavigationState? get currentConfiguration {
    return navigation?.state;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Navigator(
        key: navigatorKey,
        pages: [
          SimplePage(Root()),
        ],
        onPopPage: (route, result) {
          return false;
        },
      );
    });
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    navigation?.change(configuration);
  }
}

class Root extends ConsumerStatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  ConsumerState<Root> createState() => _RootState();
}

class _RootState extends ConsumerState<Root> {
  late InnerRouterDelegate routerDelegate;
  late ChildBackButtonDispatcher backButtonDispatcher;

  @override
  void initState() {
    super.initState();
    routerDelegate = InnerRouterDelegate();
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
    return Scaffold(
      body: Router(
        routerDelegate: routerDelegate,
        backButtonDispatcher: backButtonDispatcher,
      ),
    );
  }
}

class InnerRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  InnerRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(navigationLogic).state.root;
        return WillPopScope(
          onWillPop: () async {
            if (ref.read(navigationLogic).canPop()) {
              ref.read(navigationLogic).pop();
              return false;
            }
            return true;
          },
          child: Navigator(
            key: navigatorKey,
            pages: [
              if (state == RootPage.login)
                const SimplePage<SignInScreen>(SignInScreen())
              else if (state == RootPage.menu)
                const SimplePage<Menu>(Menu())
              else if (state == RootPage.loading)
                const SimplePage<_Loading>(_Loading())
              //...List.generate(
              //  screens.list.length,
              //  (index) {
              //    final screen = screens.list[index];
              //    return SimplePage<Container>(Container());
              //  },
              //),
            ],
            onPopPage: (route, result) {
              if (ref.read(navigationLogic).canPop()) {
                ref.read(navigationLogic).pop();
              }
              return route.didPop(result);
            },
          ),
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    // parse route
    assert(false);
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Adatok betöltése...'),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
