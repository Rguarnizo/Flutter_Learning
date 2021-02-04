part of 'permission_bloc.dart';

@immutable
abstract class PermissionEvent {}

class PermissionCheck extends PermissionEvent{
  
  PermissionCheck();

  Future<bool> get gpsActive async  => await Geolocator.isLocationServiceEnabled();
  Future<bool> get gpsPermission async  => await Permission.location.isGranted ;
}
