import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInitial());

  @override
  Stream<PermissionState> mapEventToState(
    PermissionEvent event,
  ) async* {
    
    if(event is PermissionAcepted) yield PermissionChange(gpsActive: event.gpsActive,gpsPermissionActive: event.gpsPermission);

  }
}
