
import 'dart:async';
import 'dart:convert';

import 'package:aplicacion_peliculas/src/models/actores_model.dart';
import 'package:http/http.dart' as http;

import 'package:aplicacion_peliculas/src/models/pelicula.dart';

class PeliculasProvider{

  String _apikey = '49500238da42c0d2580d18b1eef3ecd4';
  String _url    = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;


  void disposeStreams(){
    _popularesStreamController?.close();
  }


  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    

    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    
    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apikey,
      'language': _language
    });

   return await _procesarRespuesta(url);
  }

   Future<List<Pelicula>> getPopulares() async {
    
    if(_cargando) return [];

    print('Cargando peliculas...');
    _cargando = false;

    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apikey,
      'language': _language,
      'page'    : _popularesPage.toString(),
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);

    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getCast(String idPel) async{
    final url = Uri.http(_url,'3/movie/$idPel/credits',{
      'api_key' : _apikey,
      'language': _language,     
    });

    
    final resp = await http.get(url);
    print(resp.statusCode);
    final decodedData = json.decode(resp.body);
    

    final cast = Cast.fromJsonList(decodedData['cast']);
    print(cast.actores);
    
    return cast.actores;
  }


  Future<List<Pelicula>> buscarPelicula(String query) async {

    final url = Uri.https(_url, '3/search/movie',{
      'api_key' : _apikey,
      'language': _language,
      'query'   : query,
    });

   return await _procesarRespuesta(url);
  }



}