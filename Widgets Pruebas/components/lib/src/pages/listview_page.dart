import 'dart:async';

import 'package:flutter/material.dart';



class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10imagenes();

    _scrollController.addListener(() {
      
      print('Pixels: ${_scrollController.position.pixels}');
      print('Max: ${_scrollController.position.maxScrollExtent}');
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_agregar10imagenes();
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Lists'),
    ),
    body: Stack(
     children: [
          _crearLista(),
          _crearLoading(),
     ], ),
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
      onRefresh: ObtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context,int index){

            final imagen = _listaNumeros[index];



          return FadeInImage(      
            image: NetworkImage('https://picsum.photos/500/300?image=$imagen'),
            placeholder: AssetImage('assets/loadinggit.gif'),
            );
        },
      ),
    );
  }

  Future<Null> ObtenerPagina1() async{
    final duration = new Duration(seconds: 2);

    new Timer(duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10imagenes();
    });

    return Future.delayed(duration);
  }

  _agregar10imagenes(){
    
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {
      
    });
  }

  Future<Null> fetchData() async {

    _isLoading = true;
    setState(() {});

    final duration = new Duration( seconds: 2 );
    return new Timer( duration, respuestaHTTP );

  }

  void respuestaHTTP() {

    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250)
    );



    _agregar10imagenes();

  }

  Widget _crearLoading() {

    if ( _isLoading ) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox( height: 15.0)
        ],
      );
      
      
      
    } else {
      return Container();
    }
  }
}