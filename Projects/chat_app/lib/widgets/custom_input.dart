import 'package:flutter/material.dart';

class CustomInpt extends StatelessWidget {
  
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInpt({
    Key key,
    @required this.icon,
    @required this.placeholder,
    @required this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(right: 20),
            child: TextField(
              controller: textController,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              obscureText: isPassword,
              decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: this.placeholder
                  
                  ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(vertical: 10),            
          );
          
  }
}
