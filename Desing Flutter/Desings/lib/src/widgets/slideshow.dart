import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {

  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  const SlideShow({
    Key key,
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey, this.bulletPrimario, this.bulletSecundario,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
            child: Center(
            child: Builder(builder:(context) {
              Provider.of<_SlideshowModel>(context)._colorPrimario = this.colorPrimario;
              Provider.of<_SlideshowModel>(context)._colorSecundario = this.colorSecundario;
              Provider.of<_SlideshowModel>(context)._bulletPrimario = this.bulletPrimario;
              Provider.of<_SlideshowModel>(context)._bulletSecundario = this.bulletSecundario;
              
          return Column(
            children: [
              if(this.puntosArriba) _Dots(length:this.slides.length),
              Expanded(child: _Slides(this.slides)),
              if(! this.puntosArriba) _Dots(length:this.slides.length),
            ],
          );
            },),
          ),
      ),
    );
    
  }

  
}



class _Dots extends StatelessWidget {
  final int length;
  
  const _Dots({this.length, Key key}) : super(key: key);

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
        children: List.generate(length, (index) => _Dot(index: index)),                
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
    final ssModel = Provider.of<_SlideshowModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: ssModel.currentPage >= index - 0.5 && ssModel._currentPage < index+0.5? ssModel.bulletPrimario:ssModel.bulletSecundario,
      height: ssModel.currentPage >= index - 0.5 && ssModel._currentPage < index+0.5? ssModel.bulletPrimario:ssModel.bulletSecundario,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: ssModel.currentPage >= index - 0.5 && ssModel._currentPage < index+0.5? ssModel._colorPrimario:ssModel._colorSecundario, 
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
      
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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



class _SlideshowModel with ChangeNotifier{

  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;
  
  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario(Color color){
    this._colorPrimario = color;
    
  }


  Color get colorSecundario => this._colorSecundario;

  set colorSecundario(Color color){
    this._colorSecundario = color;
    
  }

  double get bulletPrimario => _bulletPrimario;

  set bulletPrimario(double bulletPrimario){
    this._bulletPrimario = bulletPrimario;
    
  }

  double get bulletSecundario => _bulletSecundario;

  set bulletSecundario(double bulletSecundario){
    this._bulletSecundario = bulletSecundario;    
  }
}