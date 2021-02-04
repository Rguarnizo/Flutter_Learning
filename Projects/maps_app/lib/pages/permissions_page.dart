import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/bloc/permission_bloc.dart';
import 'package:maps_app/helpers/helpers.dart';
import 'package:permission_handler/permission_handler.dart';


class PermissionsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final permissionBloc = BlocProvider.of<PermissionBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('To use this application you need active GPS'),
            MaterialButton(              
              child: Text(
                'Solicitar Acceso',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              shape: StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () async{               
               final status = await Permission.location.request();
               print(status);
               if(status == PermissionStatus.permanentlyDenied){
                 showModal(context,PermissionsPage());
               }
               permissionBloc.add(PermissionCheck(permissionStatus: status));                                                                                               
              },
            )
          ],
        ),
     ),
   );
  }
}