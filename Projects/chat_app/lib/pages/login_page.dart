import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
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
            Logo(),
            _From(),
            Labels(),
            Text('Terminos y condiciones de uso')
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
  final emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomInpt(icon: Icons.mail_outline,placeholder: 'Email',keyboardType: TextInputType.emailAddress,textController: emailCtrl,),
          CustomInpt(icon: Icons.lock_open_outlined,placeholder: 'Password',keyboardType: TextInputType.emailAddress,textController: emailCtrl,isPassword: true,),
          RaisedButton(onPressed: (){

          }, child: null)
        ],
      ),
    );
  }
}

