library easy_route_transitions;

/// A Calculator.
import 'package:flutter/material.dart';

/// Animation Types, espected add more.
enum AnimationType { normal, fadeIn }

///Main class, [context] is a BuildContext in the app,
///[child] is a page to navigate,
///[animation] is a type of aniamation,
@deprecated
class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;


  ///Instanciate of Route Transitions,[replacement] default value is false, [duration] default value is 300 milliseconds, and
  ///[animation] default value is Normal.
  RouteTransitions(
      {@required this.context,
      @required this.child,
      this.replacement = false,
      this.duration = const Duration(milliseconds: 300),
      this.animation = AnimationType.normal}) {
    switch (animation) {
      case AnimationType.normal:
        Navigator.push(context, MaterialPageRoute(builder: (_) => this.child));
        break;
      case AnimationType.fadeIn:
        this._fadeInTransition();
        break;
    }
  }

  ///Push with tansition FadeIn for navigate to other page
  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => this.child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
              child: child,
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut)));
        });

    navigateToPage(route);
  }

  //Decition to replacement or not route navigation.
  void navigateToPage(Route route) => this.replacement
      ? Navigator.pushReplacement(context, route)
      : Navigator.push(context, route);
}
