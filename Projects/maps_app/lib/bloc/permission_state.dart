part of 'permission_bloc.dart';

@immutable
abstract class PermissionState {}

class PermissionInitial extends PermissionState {
  final bool gpsActive;
  final bool gpsPermissionActive;

  PermissionInitial({this.gpsActive = false, this.gpsPermissionActive = false});

}


class PermissionChange extends PermissionState {
  final bool gpsActive;
  final bool gpsPermissionActive;

  PermissionChange({this.gpsActive = false, this.gpsPermissionActive = false});

}