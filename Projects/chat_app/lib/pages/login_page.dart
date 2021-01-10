import 'package:chat_app/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Logo(),
            _From(),
            _Labels(),
            Text('Terminos y condiciones de uso')
          ],
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/loginLogo.jpg'),
              height: 300,
              width: 300,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Chat with Friends',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }
}

class _From extends StatefulWidget {
  _From({Key key}) : super(key: key);

  @override
  __FromState createState() => __FromState();
}

class __FromState extends State<_From> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomInpt(),
          RaisedButton(onPressed: null, child: null)
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels({Key key}) : super(key: key);

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
