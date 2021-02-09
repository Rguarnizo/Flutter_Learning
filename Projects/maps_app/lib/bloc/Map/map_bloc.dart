import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/themes/map_styles_themes.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapInitial> {
  MapBloc() : super(MapInitial());

  GoogleMapController _mapController;

  Polyline _myRoute = new Polyline(polylineId: PolylineId('mi_ruta'),width: 4,color: Colors.white);
  Polyline _routeStartEnd = new Polyline(polylineId: PolylineId('mi_ruta_destino'),width: 4,color: Colors.white);

  void initMap(GoogleMapController controller){

    if(!state.mapReady){
      this._mapController = controller;
      this._mapController.setMapStyle(jsonEncode(nightGoogle));
      //TODO: Change map style.

      add(OnMapReady());
    }

  }


  void moveCam(LatLng destination){

    final cameraUpdate = CameraUpdate.newCameraPosition(CameraPosition(target: destination,zoom: 15));

    this._mapController?.animateCamera(cameraUpdate);


  }







  @override
  Stream<MapInitial> mapEventToState(
    MapEvent event,
  ) async* {
    
    if(event is OnMapReady)       yield state.copyWith(mapReady: true); 
    if(event is OnLocationUpdate) yield* this.onLocationUpdate(event);  
    if(event is OnMarkRoute)      yield* this.onMarkRoute(event);       
    if(event is OnFollowLocation) yield* this.onFollowLocation(event);
    if(event is OnMoveMap){        print('event: ${event.ubication}'); yield state.copyWith(centralLocation: event.ubication); }
    if(event is OnCreateRouteStartEnd) yield* this._onCreateRouteStartEnd(event);

  }





  Stream<MapInitial> onLocationUpdate(OnLocationUpdate event)async* {
    List<LatLng> points = [...this._myRoute.points,event.ubication];
      this._myRoute = this._myRoute.copyWith(pointsParam: points);

      if(state.followLocation){
        moveCam(event.ubication);
      }

      final currentPolyLines = state.polylines;
      currentPolyLines['mi_ruta'] = this._myRoute;

      yield state.copyWith(polylines: currentPolyLines);

  }

  Stream<MapInitial> onMarkRoute(OnMarkRoute event) async* {
    if(!state.drawTravel){
        this._myRoute = this._myRoute.copyWith(colorParam: Colors.redAccent);
      }else{
        this._myRoute = this._myRoute.copyWith(colorParam: Colors.transparent);
      }

      final currentPolyLines = state.polylines;
      currentPolyLines['mi_ruta'] = this._myRoute;

      yield state.copyWith(polylines: currentPolyLines,drawTravel: !state.drawTravel);
  }

  Stream<MapInitial> onFollowLocation(OnFollowLocation event) async* {

    if(state.followLocation) this.moveCam(this._myRoute.points[this._myRoute.points.length -1]);

    yield state.copyWith(followLocation: !state.followLocation);

  }

  Stream<MapInitial> _onCreateRouteStartEnd(OnCreateRouteStartEnd event) async*{

    this._routeStartEnd = this._routeStartEnd.copyWith(
      pointsParam: event.routeCoords,
    );

    final currentPolylines = state.polylines;
    currentPolylines['mi_ruta_destino'] = this._routeStartEnd;


    yield state.copyWith(polylines: currentPolylines);
  }
}
