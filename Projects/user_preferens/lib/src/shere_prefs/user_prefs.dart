
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  
    //Ninguna de estas propiedades se usa
    bool _colorSecundario;
    int  _genero;
    String _nombre;

  
  
    static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

    PreferenciasUsuario();
    
    factory PreferenciasUsuario._internal(){
      return _instancia;
    }


  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();

  }

  get genero{
    return _prefs.getInt('genero')?? 1;
  }

  set genero(int value)=> _prefs.setInt('genero', value);

  get nombre => _prefs.get('nombre');
  set nombre(String value) => _prefs.setString('nombre', value);






}