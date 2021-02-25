import 'package:easy_route_transitions/easy_route_transitions.dart';
import 'package:flutter/material.dart';
import 'package:package_transitions/pages/page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 1'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: MaterialButton(
          onPressed: () => RouteTransitions(
              context: context,
              child: Page2(),
              animation: AnimationType.fadeIn,
              duration: Duration(seconds: 2),
              ),
          child: Text(
            'Go to page 2',
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
