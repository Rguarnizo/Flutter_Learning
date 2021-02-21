import 'package:flutter/material.dart';

enum AnimationType { normal, fadeIn }

class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final AnimationType animation;

  RouteTransitions(
      {@required this.context, @required this.child, this.animation = AnimationType.normal}){
        Navigator.push(context,MaterialPageRoute(builder: (_) => this.child));
      }
}
