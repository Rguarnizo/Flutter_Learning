part of 'map_bloc.dart';

@immutable
class MapInitial {
  final bool mapReady;
  final bool drawTravel;
  final bool followLocation;

  //Polylines
  final Map<String, Polyline> polylines;

  MapInitial({
    this.mapReady = false,
    this.drawTravel = true,
    this.followLocation = false,
    Map<String, Polyline> polylines,
  }) : this.polylines = polylines ?? new Map();

  MapInitial copyWith({bool mapReady, bool drawTravel,bool followLocation,Map<String, Polyline> polylines,}) => MapInitial(
      mapReady: mapReady ?? this.mapReady,
      drawTravel: drawTravel ?? this.drawTravel,
      polylines: polylines ?? this.polylines,
      followLocation: followLocation?? this.followLocation);
}
