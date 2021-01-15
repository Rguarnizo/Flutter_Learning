import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _Titulo());
  }
}

class _ListaTareas extends StatelessWidget {
  const _ListaTareas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (_, i) => _ListItem(),
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
  const _ListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.all(10),
      child: Text(
        'BlueGrey',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
