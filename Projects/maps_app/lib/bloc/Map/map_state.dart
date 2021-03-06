part of 'map_bloc.dart';

@immutable
class MapInitial {
  final bool mapReady;
  final bool drawTravel;
  final bool followLocation;
  final LatLng centralLocation;

  //Polylines
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  MapInitial({
    Map<String, Polyline> polylines,
    Map<String, Marker> markers,
    LatLng centralLocation,
    this.mapReady = false,
    this.drawTravel = true,
    this.followLocation = false,
  })  : this.polylines = polylines ?? new Map(),
       this.markers = markers ?? new Map(),
       this.centralLocation = centralLocation ?? new LatLng(0, 0);

  MapInitial copyWith(
          {bool mapReady,
          bool drawTravel,
          bool followLocation,
          Map<String, Polyline> polylines,
          Map<String, Marker> markers,
          LatLng centralLocation}) =>
      MapInitial(
          mapReady: mapReady ?? this.mapReady,
          drawTravel: drawTravel ?? this.drawTravel,
          polylines: polylines ?? this.polylines,
          followLocation: followLocation ?? this.followLocation,
          centralLocation: centralLocation ?? this.centralLocation,
          markers: markers ?? this.markers,          
          );
}
