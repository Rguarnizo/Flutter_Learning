import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/widgets/boton_gordo.dart';
import 'package:headers/src/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          PageHeader(),
          BotonGordo(
            onPress        : (){
                print('Hola');
            },
            icon           : FontAwesomeIcons.carCrash,
            primaryColor   : Color(0xff6989F5),
            secondaryColor : Color(0xff906EF5),          
            text           : 'Motor Accident',),
          
        ],
      ),
      
    );
  }
}


class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Asistencia Medica',
      subtitle: 'Solicitaste ',
      color1: Color(0xff526bf6), 
      color2: Color(0xff67acf2),
    );
  }
}
