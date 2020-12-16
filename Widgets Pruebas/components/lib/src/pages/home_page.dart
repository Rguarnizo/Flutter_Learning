import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/provider/menu_provider.dart';
import 'package:components/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final opciones = ['uno','dos','tres','cuatro','cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Components'
        ),
      ),
      body: _lista(),
    );
  }

  Widget _lista(){
    
    //menuProvider.cargarData();

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [ ], //? Opcional Data por defecto.
      builder: (context,AsyncSnapshot<List<dynamic>> snapshot){
        
        return ListView(
          children: _listaItems(snapshot.data,context),
        );
      },
    );

    
  }

    List<Widget> _listaItems(List<dynamic> data,BuildContext context) {
    
      final List<Widget> opciones = [];

      data.forEach((opt) {
        final widgetTemp = ListTile(
          title: Text( opt['texto']),
          leading: getIcon(opt['icon']),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: (){

            Navigator.pushNamed(context,opt['ruta']);

            /* final route = MaterialPageRoute(
              builder: (context) => AlertPage(),          
              );
            Navigator.push(context, route); */
                        
          },
          );


          opciones..add(widgetTemp)
          ..add(Divider());


      });

      return opciones;

  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
        
      );
      lista..add(tempWidget)
           ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorto(){
    return opciones.map((item){
      return Column(
        children: [
          ListTile(
            title: Text(item),
            subtitle: Text('Wow'),
            leading: Icon(Icons.assistant),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => print('hello')
            ),          
          Divider(),
        ],
      );
    }).toList();
  }


}