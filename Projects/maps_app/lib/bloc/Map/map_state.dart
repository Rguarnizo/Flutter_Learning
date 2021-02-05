part of 'map_bloc.dart';

@immutable
class MapInitial {
  final bool mapReady;
  final bool drawTravel;

  //Polylines
  final Map<String, Polyline> polylines;

  MapInitial({
    this.mapReady = false,
    this.drawTravel = true,
    Map<String, Polyline> polylines,
  }) : this.polylines = polylines ?? new Map();

  MapInitial copyWith({bool mapReady, bool drawTravel,Map<String, Polyline> polylines,}) => MapInitial(
      mapReady: mapReady ?? mapReady,
      drawTravel: drawTravel ?? this.drawTravel,
      polylines: polylines ?? this.polylines,);
}
