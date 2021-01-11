import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:headers/src/models/slider_model.dart';

class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;

  const SlideShow({
    Key key,
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: SafeArea(
            child: Center(
            child: Column(
            children: [
              if(this.puntosArriba) _Dots(length:this.slides.length,colorPrimario: this.colorPrimario,colorSecundario: this.colorSecundario,),
              Expanded(child: _Slides(this.slides)),
              if(! this.puntosArriba) _Dots(length:this.slides.length,colorPrimario: this.colorPrimario,colorSecundario: this.colorSecundario,),
            ],
          )
          ),
      ),
    );
    
  }

  
}



class _Dots extends StatelessWidget {
  final int length;
  final Color colorPrimario;
  final Color colorSecundario;
  const _Dots({this.length, Key key,this.colorPrimario,this.colorSecundario}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final List<Widget> dots = [];

    // for (var i = 0; i < length; i++) {
    //   dots.add(_Dot(i,));
    // }

    return Container(
      height: 70,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(length, (index) => _Dot(index: index,colorPrimario: this.colorPrimario,colorSecundario: this.colorSecundario,)),                
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
    final Color colorPrimario;
  final Color colorSecundario;

  
  const _Dot({
    Key key,
    this.index,
    this.colorPrimario,
    this.colorSecundario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: pageViewIndex >= index - 0.5 && pageViewIndex < index+0.5? colorPrimario:colorSecundario, 
      shape: BoxShape.circle
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides, {Key key}) : super(key: key);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((e) => _Slide(child: e,)).toList(),

      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;
  const _Slide({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(40),
      child: child,
    );
  }
}