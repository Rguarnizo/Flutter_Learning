import 'package:aplicacion_peliculas/src/models/pelicula.dart';
import 'package:flutter/material.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;
  MovieHorizontal({Key key, @required this.peliculas,@required this.siguientePagina}) : super(key: key);
  final _pageController = new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: _pageController,
        children: _tarjetas(context),
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return peliculas.map((p) {
      return GestureDetector(
          onTap: (){
            Navigator.pushNamed(context,'detalle',arguments: p);
          },
          child: Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FadeInImage(
                  image: NetworkImage(p.getPosterIMG()),
                  placeholder: AssetImage('assets/Loading3.gif'),
                  fit: BoxFit.cover,
                  height: 140.0,
                ),
              ),
              Text(
                p.title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      );
    }).toList();
  }
}
