import 'package:flutter/material.dart';
import 'package:qr_reader/src/providers/db_provider.dart';


class MapasPage extends StatelessWidget {
  const MapasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder <List<ScanModel>>(
      future: DBProvider.db.getScansList(),
      builder: (context, snapshot) {
        
        if(!snapshot.hasData){
          return Center(child: CircularProgressIndicator(),);
        }

        final scans = snapshot.data;

        if(scans.length == 0){
          return Center(
            child: Text('No hay información para mostrar'),
          );
        }


        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(color: Colors.red,),
            onDismissed: (direction) {
              DBProvider.db.deleteScan(scans[index].id); 
            },
            child: ListTile(
              leading: Icon(Icons.cloud_queue,color:Theme.of(context).primaryColor),
              title: Text(scans[index].valor),
              subtitle: Text('Id: ${scans[index].id}'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
            ),
          ),
        );


      },
      );
  }
}