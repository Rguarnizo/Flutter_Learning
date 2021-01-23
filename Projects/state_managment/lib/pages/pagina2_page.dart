import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(onPressed: (){},color: Colors.blue,child: Text('Establecer Usuario'),),
            MaterialButton(onPressed: (){},color: Colors.blue,child: Text('Establecer Edad'),),
            MaterialButton(onPressed: (){},color: Colors.blue,child: Text('Añadir Profesion'),),
          ],
        )
     ),
   );
  }
}