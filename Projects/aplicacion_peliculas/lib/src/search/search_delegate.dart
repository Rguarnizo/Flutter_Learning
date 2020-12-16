import 'package:aplicacion_peliculas/src/models/pelicula.dart';
import 'package:aplicacion_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';


class DataSearch extends SearchDelegate {
  String seleccion;
  final PeliculasProvider peliculasProvider = PeliculasProvider();
  final peliculas = [
    'Spiderman',
    'Capitan America',
    'El Coño',
    'Electrify',
    'Watefak?'
  ];

  final peliculasRecientes = [
    'Spiderman',
    'Capitan America',
  ];





  @override
  List<Widget> buildActions(BuildContext context) {
      //Acciones del Appbar.
      return [
        IconButton(icon: Icon(Icons.clear), onPressed: (){
          query = '';
        })
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del AppBar
      
      return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,), onPressed: (){
        close(context,null);
      });
      
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Crea los resultados a mostrar
      
      return Center(child: Container(
        height: 100,
        width: 100,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),);
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Sugerencias mientras se escribe.



    if(query.isEmpty){
      return Container();
    }

    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if(snapshot.hasData){

          final peliculas = snapshot.data;
          return ListView(
           children: peliculas.map((e){
             return ListTile(
               leading: FadeInImage(
                 image: NetworkImage(e.getPosterIMG()),
                 placeholder: AssetImage('assets/Loading3.gif'),
               ),
               title: Text(e.title),
               subtitle: Text(e.originalTitle),
               onTap: (){
                 close(context,null);
                 e.uniqueId = '';
                 Navigator.of(context).pushNamed('detalle',arguments: e); 
               },
             );
           }).toList()
          );
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );




    /* final listaSugerida = (query.isEmpty) ? peliculasRecientes: peliculas.where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();
      
      return ListView.builder(
        itemCount: listaSugerida.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaSugerida[index]),
            onTap: (){
              seleccion = listaSugerida[index];
              showResults(context);
            },
          );
        },
      );
      
    }
  */
  }
}