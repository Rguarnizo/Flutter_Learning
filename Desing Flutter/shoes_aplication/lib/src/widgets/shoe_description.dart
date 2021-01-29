import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String titulo;
  final String descripcion;

  const ShoeDescription({
    Key key,
    @required this.titulo,
    @required this.descripcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(
          title: titulo,
        ),
        _description(
          description: descripcion,
        ),
      ],
    );
  }
}


class _title extends StatelessWidget {
  final String title;

  const _title({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Text(
        '$title',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}


class _description extends StatelessWidget {
  final String description;

  const _description({
    Key key,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        '$description',
        style: TextStyle(
          color: Colors.black54,
        ),
        
      ),
    );
  }
}

