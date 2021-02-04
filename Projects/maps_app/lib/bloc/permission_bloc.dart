import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_app/pages/map_page.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInit());

  @override
  Stream<PermissionState> mapEventToState(
    PermissionEvent event,
  ) async* {
    if(event is PermissionInit)  yield PermissionInit(); this.add(PermissionCheck());
    if(event is PermissionCheck){
      if(! await event.gpsActive) yield GpsDissable(); else
      if(! await event.gpsPermission) yield PermissionGpsDenied(event.permissionStatus); else
      yield PermissionsAccepted();
    }

  }

  
}
