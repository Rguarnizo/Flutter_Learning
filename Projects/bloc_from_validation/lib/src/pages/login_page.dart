import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  _crearFondo(context) {
    final size = MediaQuery.of(context).size;

    final fondo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1.0),
        Color.fromRGBO(90, 70, 178, 1.0)
      ])),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: [
        fondo,
        Positioned(top: 90.0, left: 30.0, child: circulo),
        Positioned(top: -40.0, left: -30.0, child: circulo),
        Positioned(bottom: -50.0, right: -10.0, child: circulo),
        Positioned(bottom: 120.0, right: 20.0, child: circulo),
        Positioned(bottom: -50.0, left: -20.0, child: circulo),
        Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Icon(
                Icons.person_pin_circle,
                color: Colors.white,
                size: 100,
              ),
              SizedBox(
                height: 20.0,
                width: double.infinity,
              ),
            ],
          ),
        )
      ],
    );
  }

  _loginForm(context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(height: 180.0),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Column(
              children: [
                Text('Ingreso'),
                SizedBox(height: 60.0,),
                _crarEmail(),
                SizedBox(height: 30.0,),
                _crarPassword(),
                SizedBox(height: 30.0,),
                _crearBoton(),
              ],
            ),
          ),
          Text('¿Olvido su contraseña?'),
        ],
      ),
    );
  }
  
  _crarEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
              icon: Icon(
            Icons.alternate_email,
            color: Colors.deepPurple,
          ))),
    );
  }

  _crarPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(          
            labelText: 'Contraseña',
              icon: Icon(
            Icons.lock,
            color: Colors.deepPurple,
          ))),
    );
  }

  _crearBoton(){
    return RaisedButton(color: Colors.deepPurple,textColor: Colors.white,onPressed: (){},padding: EdgeInsets.symmetric(horizontal:80,vertical:15 ),child: Container(child: Text('Ingresar'),),shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5.0)),);
  }
}

