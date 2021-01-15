import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:_MainScroll());
  }
}

class _ListaTareas extends StatelessWidget {
 
    final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => items[index],
    );
  }
}

class _MainScroll extends StatelessWidget {
  const _MainScroll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(          
          backgroundColor: Colors.red,
          title: Text('Hola Mundo'),
          floating: true,
        ),
        SliverList(delegate: SliverChildListDelegate(
          [          
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
          ]
        )),
      ],
    );
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'New',
              style: TextStyle(color: Color(0xff532128), fontSize: 50),
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 8,
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  width: 100,
                  height: 8,
                  decoration: BoxDecoration(color: Color(0xffF7CDD5)),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text('List',
                      style: TextStyle(
                          color: Color(0xffD93A30),
                          fontSize: 50,
                          fontWeight: FontWeight.bold))),
              
            ],
          )
        ],
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final String titulo;
  final Color color;
  const _ListItem(this.titulo,this.color,{
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.all(10),
      child: Text(
        titulo,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
