import 'package:flutter/material.dart';



class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page'),
      ),
      body: ListView(
        children: [
          _cardTipo1(),
          SizedBox(height: 30,),
          _cardTipo2(),
        ],
        padding: EdgeInsets.all(10.0),
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text('Que pedo hay mucho texto aquí que cosa mas rara ay dios mio que gonorrea parce, ya se viene la demencia'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 30,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          FadeInImage(          
            image: NetworkImage('https://w.wallhaven.cc/full/83/wallhaven-839zjk.jpg'),
            placeholder: AssetImage('assets/loadinggit.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),          
          Container(
            child: Text('No tengo idea que poner'),
            padding: EdgeInsets.all(10.0),            
            ),
        ],        
      ),
      
    );

  }
}