import 'package:bloc_from_validation/src/bloc/provider.dart';
import 'package:bloc_from_validation/src/providers/usuario_provider.dart';
import 'package:bloc_from_validation/src/utils/utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({Key key}) : super(key: key);

final usuarioProvider = new UsuarioProvider();

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
    final bloc = Provider.of(context);
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
                SizedBox(
                  height: 60.0,
                ),
                _crarEmail(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _crarPassword(bloc),
                SizedBox(
                  height: 30.0,
                ),
                _crearBoton(bloc),
              ],
            ),
          ),
          GestureDetector(child: Text('Crear una nueva cuenta.'),onTap: (){
              Navigator.of(context).pushNamed('registro');
          },),
        ],
      ),
    );
  }

  _crarEmail(LoginBloc bloc) {
    return StreamBuilder<String>(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'ejemplo@correo.com',
                  labelText: 'Correo electrónico',
                  counterText: snapshot.data,
                  errorText: snapshot.error,
                  icon: Icon(
                    Icons.alternate_email,
                    color: Colors.deepPurple,
                  )),
              onChanged: bloc.changeEmail,
            ),
          );
        });
  }

  _crarPassword(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Contraseña',
                  counterText: snapshot.data,
                  errorText: snapshot.error,
                  icon: Icon(
                    Icons.lock,
                    color: Colors.deepPurple,
                  )),
              onChanged: bloc.changePassword,
            ),
          );
        });
  }

  _crearBoton(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (context, snapshot) {
        
            return RaisedButton(
            color: Colors.deepPurple,
            textColor: Colors.white,
            onPressed: snapshot.hasData? () => _login(bloc,context):null,
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            
            child: Container(
              child: Text('Ingresar'),
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          );
        }
            
    );
  }

  _login(LoginBloc bloc,context)async {
  
    print('email: ${bloc.email}');
    print('password: ${bloc.password} ');
    final info =  await usuarioProvider.login(bloc.email,bloc.password);

    if(info['ok']){
      Navigator.pushReplacementNamed(context, 'home');
    }else{
      mostrarAlerta(context,info['mensaje']);
    }

  }
}
