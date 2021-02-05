part of 'permission_bloc.dart';

@immutable
abstract class PermissionState {}

class PermissionInit extends PermissionState{

}

class PermissionsAccepted extends PermissionState{

}

class PermissionGpsDenied extends PermissionState{
  final status;
  PermissionGpsDenied(this.status);
  
}

class GpsDissable extends PermissionState{
  
}