import 'package:flutter/material.dart';






class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

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
