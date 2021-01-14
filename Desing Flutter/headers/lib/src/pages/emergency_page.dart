import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        title: 'Asistencia Medica',
        subtitle: 'Solicitaste ',
        color1: Color(0xff526bf6), 
        color2: Color(0xff67acf2),
      ),
    );
  }
}
