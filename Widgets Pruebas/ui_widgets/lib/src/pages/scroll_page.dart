import 'package:flutter/material.dart';


class ScrollPage extends StatelessWidget {
  const ScrollPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _pagina1(),
          _pagina2()
        ],
      )
    );
  }

  _pagina1() {
    return Stack(
      children: [
        _colorFondo(),
        _imagenFondo(),
        _textos(),        
      ],
    );
  }

  _pagina2() {
    return Stack(
      children: [
        _colorFondo(),
        _botonEnMedio(),
      ],
    );
  }

  _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108,192,218,1.0),
    );
    
  }

  _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(image: AssetImage('assets/scroll-1.png'),fit: BoxFit.cover,),
    );
  }

  _textos() {

    final estiloText = TextStyle(color: Colors.white,fontSize: 50);
    return SafeArea(
        child: Column(
        children: [
          SizedBox(height: 40.0,),
          Text('11°',style: estiloText,),
          Text('Miercoles',style: estiloText,),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down,size:70,color: Colors.white,)
        ],
      ),
    );
  }

  _botonEnMedio() {
    return Center(child: RaisedButton(child: Padding(
      padding: const EdgeInsets.all(10),
      child: Text('Bienvenidos',style: TextStyle(fontSize: 25)),
    ),onPressed: (){},shape: StadiumBorder(),));
  }
}