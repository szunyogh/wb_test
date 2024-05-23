import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPage<T> extends Page<T> {
  final Widget child;

  const CustomPage(this.child) : super();

  @override
  Route<T> createRoute(BuildContext context) {
    return MyCustomRoute(widget: child, settings: this);
  }
}

class SimplePage<T> extends Page<T> {
  final Widget child;

  const SimplePage(this.child) : super();

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => child,
      settings: this,
    );
  }
}

class MyCustomRoute<T> extends CupertinoPageRoute<T> {
  final Widget widget;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  MyCustomRoute({required this.widget, RouteSettings? settings})
      : super(
          settings: settings,
          builder: (BuildContext context) {
            return widget;
          },
        );
}

class CupertinoModalSheetPage<T> extends Page<T> {
  final Widget child;
  final CupertinoModalSheetRouteTransition firstTransition;

  const CupertinoModalSheetPage(
    this.child, {
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
    this.firstTransition = CupertinoModalSheetRouteTransition.scale,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoModalSheetRoute<T>(
      builder: (_) => child,
      settings: this,
      firstTransition: firstTransition,
    );
  }
}

const double sheetOffset = 10;
const double displayCornerRadius = 38.5;
const double sheetCornerRadius = 20;
const double scaleFactor = 1 / 12;
const double breakpointWidth = 800;
const Size maxSize = Size(700, 1000);

enum CupertinoModalSheetRouteTransition {
  none,
  scale,
  fade,
}

class CupertinoModalSheetRoute<T> extends PageRouteBuilder<T> {
  CupertinoModalSheetRoute({
    required this.builder,
    super.barrierDismissible = true,
    super.settings,
    super.transitionDuration,
    super.reverseTransitionDuration,
    super.barrierLabel,
    super.maintainState = true,
    super.fullscreenDialog = true,
    this.firstTransition = CupertinoModalSheetRouteTransition.none,
  }) : super(
          pageBuilder: (_, __, ___) => const SizedBox.shrink(),
          opaque: false,
          barrierColor: kCupertinoModalBarrierColor,
        );

  /// A builder that builds the widget tree for the [CupertinoModalSheetRoute].
  final WidgetBuilder builder;

  /// A transition for initial page push animation.
  final CupertinoModalSheetRouteTransition firstTransition;

  Curve _curve = Curves.easeInOut;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    final size = MediaQuery.of(context).size;
    final BoxConstraints constrainsts;
    if (size.width > breakpointWidth) {
      if (isFirst) {
        return builder(context);
      }
      constrainsts = BoxConstraints(maxWidth: maxSize.width, maxHeight: min(size.height * 0.9, maxSize.height));
    } else {
      constrainsts = BoxConstraints(
        minWidth: size.width,
      );
    }
    if (isFirst) {
      return builder(context);
    } else {
      final paddingTop = _paddingTop(context);
      return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            var borderRadius = BorderRadius.vertical(top: Radius.circular(sheetCornerRadius * animation.value));
            if (size.width > breakpointWidth) {
              if (isFirst) {
                return builder(context);
              }
              borderRadius = BorderRadius.all(Radius.circular(sheetCornerRadius * animation.value));
            }
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: paddingTop + sheetOffset),
                child: CupertinoUserInterfaceLevel(
                  data: CupertinoUserInterfaceLevelData.elevated,
                  child: ConstrainedBox(
                      constraints: constrainsts,
                      child: Visibility(
                        visible: barrierDismissible,
                        replacement: ClipRRect(
                          borderRadius: borderRadius,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: builder(context),
                          ),
                        ),
                        child: _gestureDetector(
                          size: size,
                          child: ClipRRect(
                            borderRadius: borderRadius,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: builder(context),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            );
          });
    }
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (MediaQuery.of(context).size.width > breakpointWidth) {
      if (isFirst) {
        return child;
      }
    }
    final secValue = secondaryAnimation.value;
    final paddingTop = _paddingTop(context);
    if (isFirst) {
      final offset = secValue * paddingTop;
      final scale = 1 - secValue * scaleFactor;
      final r = paddingTop > 30 ? displayCornerRadius : 0.0;
      final radius = r - secValue * (r - sheetCornerRadius);
      final clipChild = ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: child,
      );
      var transitionChild = _stackTransition(offset, scale, secondaryAnimation, clipChild);
      if (firstTransition == CupertinoModalSheetRouteTransition.fade) {
        transitionChild = FadeTransition(
          opacity: animation,
          child: transitionChild,
        );
      }
      if (firstTransition == CupertinoModalSheetRouteTransition.scale) {
        transitionChild = ScaleTransition(
          scale: animation,
          child: transitionChild,
        );
      }
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: transitionChild,
      );
    }
    if (secondaryAnimation.isDismissed) {
      final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
      final curveTween = CurveTween(curve: _curve);
      return SlideTransition(
        position: animation.drive(curveTween).drive(tween),
        child: child,
      );
    } else {
      final dist = (paddingTop + sheetOffset) * (1 - scaleFactor);
      final double offset = secValue * (paddingTop - dist);
      final scale = 1 - secValue * scaleFactor;
      return _stackTransition(offset, scale, secondaryAnimation, child);
    }
  }

  Widget _gestureDetector({required Widget child, required Size size}) {
    final Function(double velocity) dragEnd;
    dragEnd = (double velocity) {
      final bool animateForward;
      if (velocity.abs() >= 1.0) {
        animateForward = velocity <= 0;
      } else {
        animateForward = (controller?.value ?? 0) > 0.5;
      }
      if (animateForward) {
        controller?.animateTo(1.0, duration: transitionDuration, curve: Curves.easeInOut);
      } else {
        navigator?.pop();
      }
      if (controller?.isAnimating ?? false) {
        late AnimationStatusListener animationStatusCallback;
        animationStatusCallback = (AnimationStatus status) {
          navigator?.didStopUserGesture();
          controller?.removeStatusListener(animationStatusCallback);
        };
        controller?.addStatusListener(animationStatusCallback);
      } else {
        if (navigator?.userGestureInProgress ?? false) {
          navigator?.didStopUserGesture();
        }
      }
    };
    return GestureDetector(
      onVerticalDragEnd: (details) {
        dragEnd(details.velocity.pixelsPerSecond.dy / size.width);
      },
      onVerticalDragCancel: () {
        dragEnd(0);
      },
      onVerticalDragStart: (_) {
        navigator?.didStartUserGesture();
      },
      onVerticalDragUpdate: ((details) {
        _curve = Curves.linear;
        controller?.value -= details.delta.dy / size.height;
      }),
      child: child,
    );
  }

  double _paddingTop(BuildContext context) {
    var paddingTop = MediaQuery.of(context).padding.top;
    if (paddingTop <= 20) {
      paddingTop += 10;
    }
    return paddingTop;
  }

  Widget _stackTransition(double offset, double scale, Animation<double> animation, Widget child) {
    return AnimatedBuilder(
      builder: (context, child) => Transform(
        transform: Matrix4.translationValues(0, offset, 0)..scale(scale),
        alignment: Alignment.topCenter,
        child: child,
      ),
      animation: animation,
      child: child,
    );
  }
}
