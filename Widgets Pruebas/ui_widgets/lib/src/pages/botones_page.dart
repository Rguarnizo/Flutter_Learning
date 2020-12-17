import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class BotonesPage extends StatelessWidget {
  const BotonesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        fixedColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.collections_bookmark),label: ''),
      ],
      ),
      body: SafeArea(
              child: Stack(children: [
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
             children: [
               _titulos(),
               _botonesRedondeados(),
             ], 
            ),
          )
        ],),
      )
    );
  }

  Widget _fondoApp() {

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color.fromRGBO(52, 54, 101, 1.0),Color.fromRGBO(35, 37, 57, 1.0)],begin: FractionalOffset(0.0,0.6),end: FractionalOffset(0.0,1.0))
      ),
    );

    final cajaRosa = Transform.rotate( 
      angle: -pi/5.0,
      child : Container(
      height: 360.0,
      width: 360.0,
      decoration: BoxDecoration(gradient: LinearGradient(colors: [Color.fromRGBO(236, 98, 188, 1.0),Color.fromRGBO(241, 142, 172, 10)]),borderRadius: BorderRadius.circular(70)),

    ));

    return Stack(
      children: [
        gradiente,
        Positioned(child: cajaRosa,top: -100,left: -100,)
      ],
    );
  }

  _titulos() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text('Classify transaction',style: TextStyle(color:Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
         SizedBox(height: 20,),
         Text('Classify transaction into particular category',style: TextStyle(color:Colors.white,fontSize: 16),),
       ], 
      ),
    );
  }

  _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue,Icons.border_all,'General'),
            _crearBotonRedondeado(Colors.cyan,Icons.ac_unit,'Copo de nieve'),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue,Icons.border_all,'General'),
            _crearBotonRedondeado(Colors.cyan,Icons.ac_unit,'Copo de nieve'),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue,Icons.border_all,'General'),
            _crearBotonRedondeado(Colors.cyan,Icons.ac_unit,'Copo de nieve'),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue,Icons.border_all,'General'),
            _crearBotonRedondeado(Colors.cyan,Icons.ac_unit,'Copo de nieve'),
          ]
        )
      ],
    );
  }

  _crearBotonRedondeado(Color color,IconData icondata,String texto) {
    return   
      Container(
        height: 180.0,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.7),
          borderRadius: BorderRadius.circular(20.0)
        ),      
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 5.0,),
            CircleAvatar(
              backgroundColor: Colors.pinkAccent,            
              child: Icon(Icons.swap_calls,color: color,size: 30,),
              radius: 35,
            ),
            Text(texto,style: TextStyle(color: Colors.pinkAccent),),
            SizedBox(height: 5.0,),
          ],
        ),
    );
  }
}