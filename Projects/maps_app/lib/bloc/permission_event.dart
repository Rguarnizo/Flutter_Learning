part of 'permission_bloc.dart';

@immutable
abstract class PermissionEvent {


}


class PermissionAcepted extends PermissionEvent{
  final gpsPermission;
  final gpsActive;

  PermissionAcepted({this.gpsPermission, this.gpsActive});  
}


class PermissionDenied extends PermissionEvent{
  final gpsPermission;
  final gpsActive;

  PermissionDenied({this.gpsPermission, this.gpsActive});  
}
