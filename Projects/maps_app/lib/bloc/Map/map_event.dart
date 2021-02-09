part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class OnMapReady extends MapEvent{

}

class OnMarkRoute extends MapEvent{

}
class OnMoveMap extends MapEvent{

  final LatLng ubication;

  OnMoveMap(this.ubication);

}

class OnFollowLocation extends MapEvent{

}


class OnLocationUpdate extends MapEvent{
  final LatLng ubication;

  OnLocationUpdate(this.ubication);
}

class OnCreateRouteStartEnd extends MapEvent {
  final List<LatLng> routeCoords;
  final double distance;
  final double duration;

  OnCreateRouteStartEnd({
    this.routeCoords,
    this.distance,
    this.duration,
  });
}
