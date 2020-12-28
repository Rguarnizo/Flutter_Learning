import 'package:flutter/material.dart';
import 'package:user_preferens/src/shere_prefs/user_prefs.dart';
import 'package:user_preferens/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  static final String routeName = 'Settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  PreferenciasUsuario prefs = new PreferenciasUsuario();

  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Pedro';
  TextEditingController _textEditing;


  @override
  void initState()  {
    super.initState();
    _textEditing = new TextEditingController(text:_nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              setState(() {
                
              _colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
            title: Text('Masculino'),
          ),
          RadioListTile(
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,            
            title: Text('Femenino'),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textEditing,
              onChanged: (value){
                prefs.nombre = value;
              },
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el telefono'),
            ),
          ),
        ],
      ),
    );
  }

  _setSelectedRadio(int valor) async{
    prefs.genero = valor;
    _genero = valor;
    setState(() {
      
    });
    
  }


}
