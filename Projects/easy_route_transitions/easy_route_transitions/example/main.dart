import 'package:easy_route_transitions/easy_route_transitions.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => Page1(),
        'page2': (_) => Page2(),
      },
    );
  }
}


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


class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Text('Pagina 2')
      ),
    );
  }
}
