import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class CardSwiper extends StatelessWidget {
  const CardSwiper({Key key,@required this.peliculas}) : super(key: key);

  final List<dynamic> peliculas;

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              child: FadeInImage(
                placeholder: AssetImage('assets/Loading3.gif'),
                image: NetworkImage(peliculas[index].getPosterIMG()),
                fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(20.0),);
          },
          itemCount: peliculas.length,
          layout: SwiperLayout.STACK,
          itemHeight: _screenSize.height * 0.5,
          itemWidth: _screenSize.width * 0.7,
        ),
    );
  }
}