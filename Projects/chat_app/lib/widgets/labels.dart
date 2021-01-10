import 'package:flutter/material.dart';


class Labels extends StatelessWidget {
  const Labels({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '¿No tienes cuenta?',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
              child: Text(
            'Crea una ahora',
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
