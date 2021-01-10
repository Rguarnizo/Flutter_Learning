import 'package:chat_app/widgets/blue_botton.dart';
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
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height *0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(title: 'Chat with Friends',),
                _From(),
                Labels(route: 'register',title: '¡Crea una cuenta!',subtitle: '¿No tienes cuenta?',),
                Text('Terminos y condiciones de uso')
              ],
            ),
          ),
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
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInpt(
            icon: Icons.mail_outline,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInpt(
            icon: Icons.lock_open_outlined,
            placeholder: 'Password',
            keyboardType: TextInputType.emailAddress,
            textController: passwordCtrl,
            isPassword: true,
          ),
          BlueButton(callBackFunction: (){
            print('email: '+ emailCtrl.text);
            print('password: '+passwordCtrl.text);
          }, text: 'Login')
        ],
      ),
    );
  }
}
