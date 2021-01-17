import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(titulo,style: TextStyle(fontWeight: FontWeight.bold),),
      content: Text(subtitulo),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          elevation: 5,
          child: Text('Ok',style:TextStyle(fontWeight: FontWeight.bold)),
          textColor: Colors.blue
        )
      ],
    ),
  );
}
