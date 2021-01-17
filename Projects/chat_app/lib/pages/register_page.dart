import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/blue_botton.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
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
                Logo(title: 'Register here!',),
                _From(),
                Labels(route: 'login',title: '¡Inicia Sesión!',subtitle: '¿Ya tienes cuenta?',),
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
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          CustomInpt(
            icon: Icons.supervised_user_circle_outlined,
            placeholder: 'Name',
            keyboardType: TextInputType.emailAddress,
            textController: nameCtrl,
          ),
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
            authService.createAccount(emailCtrl.text, passwordCtrl.text, nameCtrl.text);
          }, text: 'Register')
        ],
      ),
    );
  }
}
