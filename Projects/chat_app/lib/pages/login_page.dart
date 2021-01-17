import 'package:chat_app/helpers/mostrar_alerta.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/blue_botton.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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



    final authService = Provider.of<AuthService>(context);



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
          BlueButton(callBackFunction:authService.autenticando? null: ()async{    
            
            //? Quita el teclado en pantalla si esta puesto
            FocusScope.of(context).unfocus();

            final loginOk = await authService.login(emailCtrl.text, passwordCtrl.text);

            if(loginOk){
              //TODO: Navegar al Login etc...
            }else{
              //? Mostrar Alerta.
              mostrarAlerta(context, 'Juumm Algo sucedio...', 'No se pudó iniciar sesion, revisa que todo este bien 🥺');
            }
          }, text: 'Login')
        ],
      ),
    );
  }
}
