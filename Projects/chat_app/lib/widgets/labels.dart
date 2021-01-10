import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String route;
  final String title;
  final String subtitle;

  const Labels({
    Key key,
    @required this.route,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            subtitle,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(route),
              child: Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blue[600],
            ),
          ))
        ],
      ),
    );
  }
}
