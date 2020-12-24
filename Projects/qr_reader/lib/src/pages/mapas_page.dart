import 'package:flutter/material.dart';
import 'package:qr_reader/src/bloc/scans_bloc.dart';
import 'package:qr_reader/src/providers/db_provider.dart';
import 'package:qr_reader/src/utils/utils.dart';


class MapasPage extends StatelessWidget {
  MapasPage({Key key}) : super(key: key);

  final ScansBloc scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {

    scansBloc.obtenerScans();

    return StreamBuilder <List<ScanModel>>(
      stream: scansBloc.scansStream,
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
              scansBloc.borrarScan(scans[index].id);
            },
            child: ListTile(
              leading: Icon(Icons.cloud_queue,color:Theme.of(context).primaryColor),
              title: Text(scans[index].valor),
              subtitle: Text('Id: ${scans[index].id}'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: (){
                launchURL(scans[index],context);
              },
            ),
          ),
        );
        },
      );
  }
}