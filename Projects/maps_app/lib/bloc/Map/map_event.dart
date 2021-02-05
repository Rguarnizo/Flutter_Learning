part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnMapReady extends MapEvent{

}

class OnMarkRoute extends MapEvent{

}


class OnLocationUpdate extends MapEvent{
  final LatLng ubication;

  OnLocationUpdate(this.ubication);
}