import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_app/pages/permissions_page.dart';
import 'package:permission_handler/permission_handler.dart';
import '../bloc/permission_bloc.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final permissionBloc = BlocProvider.of<PermissionBloc>(context);


    return Scaffold(
      body: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {

          permissionBloc.add(PermissionCheck());

          if (state is PermissionGpsDenied)            
            return PermissionsPage();
          if (state is GpsDissable)
            return Center(child: Text('Gps Is needed to use the app'),);
          if (state is PermissionsAccepted)
            return MainMap();
        },
      ),
    );
  }
}

class MainMap extends StatelessWidget {
  const MainMap({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green,width: 200,height: 200,);
  }
}
