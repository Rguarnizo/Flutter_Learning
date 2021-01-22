import 'package:flutter/material.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_MainScroll(), _BotonNewList()],
    ));
  }
}

class _BotonNewList extends StatelessWidget {
  const _BotonNewList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return Positioned(
      bottom: -10,
      right: 0,
      child: ButtonTheme(
        minWidth: size.width * 0.9,
        height: 70,
        child: RaisedButton(
          onPressed: () {},
          color: appTheme.darkTheme
              ? appTheme.currentTheme.accentColor
              : Color(0xffED6762),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
          ),
          child: Text(
            'Create new List',
            style: TextStyle(
                color: appTheme.currentTheme.scaffoldBackgroundColor,
                fontSize: 20,
                letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
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
    final appTheme = Provider.of<ThemeChanger>(context);
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        // SliverAppBar(
        //   backgroundColor: Colors.red,
        //   title: Text('Hola Mundo'),
        //   floating: true,
        // ),
        //! Sliver Personalizado
        SliverPersistentHeader(
          delegate: _SliverCustomHeaderDelegate(
              child: Container(
                  color: appTheme.currentTheme.scaffoldBackgroundColor,
                  child: _Titulo()),
              maxheigth: 250,
              minheigth: 200),
          floating: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          _ListItem('Orange', Color(0xffF08F66)),
          _ListItem('Family', Color(0xffF2A38A)),
          _ListItem('Subscriptions', Color(0xffF7CDD5)),
          _ListItem('Books', Color(0xffFCEBAF)),
          _ListItem('Orange', Color(0xffF08F66)),
          _ListItem('Family', Color(0xffF2A38A)),
          _ListItem('Subscriptions', Color(0xffF7CDD5)),
          _ListItem('Books', Color(0xffFCEBAF)),
          SizedBox(
            height: 150,
          ),
        ])),
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minheigth;
  final double maxheigth;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minheigth,
    @required this.maxheigth,
    @required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => (minheigth > maxheigth) ? minheigth : maxheigth;

  @override
  double get minExtent => (minheigth < maxheigth) ? maxheigth : minheigth;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxheigth != oldDelegate.maxExtent ||
        minheigth != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'New',
              style: TextStyle(
                  color: appTheme.darkTheme ? Colors.grey : Color(0xff532128),
                  fontSize: 50),
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
                  decoration: BoxDecoration(color: appTheme.darkTheme ? Colors.grey : Color(0xff532128),),
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
  const _ListItem(
    this.titulo,
    this.color, {
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
