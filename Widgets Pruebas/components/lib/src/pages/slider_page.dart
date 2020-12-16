import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 10.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (appBar: AppBar(
      title: Text('Sliders'),
      
    ),
    body: Container(
      padding:EdgeInsets.only(top: 50.0),
      child: Column(      
        children: [
          _crearSlider(),
          _crearCheckBox(),
          _crearSwitch(),
          Expanded(child: _crearImagen()),
        ],
      ),
    ),
    );
  }

  Widget _crearSlider() {
    
    return Slider(
      onChanged: (_bloquearCheck) ? null: (value){
        setState(() {
          _valorSlider = value;
          print(_valorSlider);
        });
      },
      label: 'Tamaño Imagen',
      divisions: 60,
      min: 10.0,
      max: 400.0,
      value: _valorSlider,
      activeColor: Colors.indigoAccent,
    );
  }

  Widget _crearCheckBox(){
    /* return Checkbox(
      value: _bloquearCheck, 
      onChanged:  (valor){

        setState(() {
        _bloquearCheck = valor;  
        });
        
      }); */
      return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _bloquearCheck, 
        onChanged: (valor){

        setState(() {
        _bloquearCheck = valor;  
        });
        
      });
      
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://i.pinimg.com/originals/be/65/92/be659217688a62f8800ffc5df8e893b6.gif'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
            title: Text('Bloquear slider'),
            value: _bloquearCheck, 
            onChanged: (valor){

            setState(() {
            _bloquearCheck = valor;  
            });
            
          });
  }
}