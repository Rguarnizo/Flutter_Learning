import 'package:flutter/material.dart';





class CustomInpt extends StatelessWidget {
  const CustomInpt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(right: 20),
            child: TextField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.mail_outline),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: 'Email'
                  ),
            ),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(horizontal: 50),
          );
          
  }
}