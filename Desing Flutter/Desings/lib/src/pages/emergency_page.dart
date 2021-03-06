import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/widgets/boton_gordo.dart';
import 'package:headers/src/widgets/headers.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  final items = <ItemBoton>[
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
  ];

  @override
  Widget build(BuildContext context) {

    bool isLarge;
    if(MediaQuery.of(context).size.height>500){
      isLarge = true;
    }else{
      isLarge = false;
    }


    List<Widget> itemMap = items
        .map((e) => FadeInLeft(
                duration: Duration(milliseconds: 1050),
                child: BotonGordo(
                text: e.texto,
                icon: e.icon,
                primaryColor: e.color1,
                secondaryColor: e.color2,
                onPress: () => print(e.texto),
              ),
        ))
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isLarge? 270:0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: itemMap,
            ),
          ),
          isLarge? PageHeader():Container(),
        ],
      ),
    );
  }
}

class BotonGordoTemp extends StatelessWidget {
  const BotonGordoTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BotonGordo(
      onPress: () {
        print('Hola');
      },
      icon: FontAwesomeIcons.carCrash,
      primaryColor: Color(0xff6989F5),
      secondaryColor: Color(0xff906EF5),
      text: 'Motor Accident',
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _Encabezado();
  }
}

class _Encabezado extends StatelessWidget {
  const _Encabezado({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia Medica',
          subtitle: 'Solicitaste ',
          color1: Color(0xff526bf6),
          color2: Color(0xff67acf2),
        ),
        Positioned(
            top: 40,
            right:-10,
            child: RawMaterialButton(
                onPressed: () => print('Vertical dots'),
                child: FaIcon(
                  FontAwesomeIcons.ellipsisV,
                  color: Colors.white,
                ))),
      ],
    );
  }
}
