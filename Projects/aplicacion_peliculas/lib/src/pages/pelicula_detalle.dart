import 'package:aplicacion_peliculas/src/models/actores_model.dart';
import 'package:aplicacion_peliculas/src/models/pelicula.dart';
import 'package:aplicacion_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

class PeliculaDetalle extends StatelessWidget {
  const PeliculaDetalle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _crearAppbar(pelicula),
        SliverList(
            delegate: SliverChildListDelegate([
          SizedBox(
            height: 10.0,
          ),
          _posterTitulo(pelicula, context),
          _descripcion(context, pelicula),
          SizedBox(child: _casting(context, pelicula)),
        ]))
      ],
    ));
  }

  Widget _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundIMG()),
          placeholder: AssetImage('assets/Loading3.gif'),
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _posterTitulo(Pelicula pelicula, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(pelicula.getPosterIMG()),
              height: 120.0,
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pelicula.title,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
              ),
              Text(pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star_border),
                  Text(pelicula.voteAverage.toString())
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _descripcion(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _casting(BuildContext context, Pelicula pelicula) {
    final PeliculasProvider peliculasProvider = PeliculasProvider();

    return Container(
      child: FutureBuilder(
        future: peliculasProvider.getCast(pelicula.id.toString()),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return _pageViewActors(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _pageViewActors(List<Actor> data) {
    return Container(
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.3,

          initialPage: 1,
        ),
        children: _actorTarjeta(data),
      ),
    );
  }

  List<Widget> _actorTarjeta(List<Actor> data) {
    return data.map((a){
      return Container(
      child: Column(
        children: [
          ClipRRect(
              child: FadeInImage(
            placeholder: AssetImage('assets/Loading3.gif'),
            image: NetworkImage(a.getPhoto()),
            fit: BoxFit.cover,
            height: 150.0,
          )),
          Text(a.name,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
    }).toList();
  }
}
