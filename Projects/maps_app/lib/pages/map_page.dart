import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../bloc/permission_bloc.dart';
import 'permissions_page.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {
          if (state is PermissionInitial) {
            return VerifyPermissions();
          }
        },
      ),
    );
  }
}

class VerifyPermissions extends StatelessWidget {
  const VerifyPermissions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final permissionBloc = BlocProvider.of<PermissionBloc>(context);

    return FutureBuilder(
        future: Permission.location.isGranted,
        builder: (context, snapshot) {
          final permissionGranted = snapshot.hasData? snapshot.data:false;

          return FutureBuilder(
            future: Geolocator.isLocationServiceEnabled(),
            builder: (context, snapshot) {
              final gpsActive = snapshot.hasData? snapshot.data:false;
              
              if (permissionGranted) {
                permissionBloc.mapEventToState(PermissionAcepted(
                    gpsActive: gpsActive, gpsPermission: permissionGranted));
              }else{
                return PermissionsPage();
              }
            },
          );
        });
  }
}
