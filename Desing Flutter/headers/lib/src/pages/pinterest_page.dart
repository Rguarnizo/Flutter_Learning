import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:headers/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    
    return ChangeNotifierProvider(
      create: (context) => _MenuModel(),
        child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),          
          ],
        )
   ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 30,
      child: Container(
        width: width,
          child: Align(
          alignment: Alignment.center,
          child: PinterestMenu(mostrar: mostrar,activeColor: Colors.lightBlue,inactiveColor: Colors.red,),
          ),
      )
      );
  }
}

class PinterestGrid extends StatefulWidget {
  

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List items = List.generate(200, (i) => i);
  ScrollController scrolLCtrl = new ScrollController();
  double scrollAnterior = 0;
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrolLCtrl.addListener(() {
      
      if(scrolLCtrl.offset > scrollAnterior && scrolLCtrl.offset > 150){
        Provider.of<_MenuModel>(context,listen: false).mostrar = false;
      //TODO: Ocultar menú,
      }else{
        //TODO: Mostrar menú,
        Provider.of<_MenuModel>(context,listen: false).mostrar = true;
      }

      scrollAnterior = scrolLCtrl.offset;
    });
  }



  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrolLCtrl,
      crossAxisCount: 4,
      physics: BouncingScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index:index),
  staggeredTileBuilder: (int index) =>
      new StaggeredTile.count(2, index.isEven ? 2 : 3),
  mainAxisSpacing: 4.0,
  crossAxisSpacing: 4.0,
);
  }
}

class _PinterestItem extends StatelessWidget {
  final index;
  const _PinterestItem({
    Key key, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
    margin:EdgeInsets.all(5),
    color: Colors.blue,
    child: new Center(
      child: new CircleAvatar(
        backgroundColor: Colors.white,
        child: new Text('$index'),
      ),
    ));
  }
}


class _MenuModel with ChangeNotifier{


  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor){
    this._mostrar = valor;
    notifyListeners();
  }
}