import 'package:flutter/material.dart';



class BasicPage extends StatelessWidget {
  BasicPage({Key key}) : super(key: key);

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          _imagen(),
          _crearTitulo(),
          _crearAcciones(),
          _crearTexto(),    
          _crearTexto(),    
          _crearTexto(),               
          _crearTexto(),    
          _crearTexto(),    
          _crearTexto(),                         
            ],
        ),
            ),
          );

  }

  _imagen() {
    return Container( width: double.infinity,child: Image(image: NetworkImage('https://i.redd.it/tk46u5nrkxm21.png'),fit: BoxFit.cover,));
  }

  _crearTitulo() {
    return SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
              child: Row(children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [            
                    Text('Lago con un puente',style: estiloTitulo,),
                    SizedBox(height:7.0,),
                    Text('Un lago en alemania',style: estiloSubTitulo,),
                  ],
                  
                  ),
                ),
                Icon(Icons.star_border,color: Colors.red,size: 30.0,),
                Text('41',style: TextStyle(fontSize: 20.0),)
              ]
            )
      ),
    );
  }

  _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _accion(Icons.call,'Call'),
        _accion(Icons.near_me,'Route'),
        _accion(Icons.share,'Shere'),
      ],
    );
  }

  _accion(IconData icon,String text) {
    return Column(
          children: [
            Icon(icon,color: Colors.blue,size: 40,),
            SizedBox(height: 5,),
            Text(text, style: TextStyle(fontSize: 15.0,color: Colors.blue),),
          ],
        );
  }

  _crearTexto() {
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Text(
          'Duis eiusmod aliqua excepteur adipisicing incididunt cillum est sint sit ipsum sunt. Ea ea excepteur magna ut fugiat cillum. Ea mollit ipsum mollit adipisicing et officia do non est.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
  
}