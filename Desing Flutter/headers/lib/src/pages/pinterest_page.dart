import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:headers/src/widgets/pinterest_menu.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Stack(
        children: [
          PinterestGrid(),
          _PinterestMenuLocation(),          
        ],
      )
   );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: 30,
      child: Container(
        width: width,
          child: Align(
          alignment: Alignment.center,
          child: PinterestMenu(),
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrolLCtrl.addListener(() {
      print('Scroll : ${scrolLCtrl.offset}');
      if(scrolLCtrl > scrollAnterior){
      //TODO: Ocultar menú,
      }else{
        //TODO: Mostrar menú,
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: scrolLCtrl,
      crossAxisCount: 4,
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