import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/themes/map_styles_themes.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapInitial> {
  MapBloc() : super(MapInitial());

  GoogleMapController _mapController;

  void initMap(GoogleMapController controller){

    if(!state.mapReady){
      this._mapController = controller;
      this._mapController.setMapStyle(jsonEncode(assassinsCreedIV));
      //TODO: Change map style.

      add(OnMapReady());
    }

  }

  @override
  Stream<MapInitial> mapEventToState(
    MapEvent event,
  ) async* {
    
    if(event is OnMapReady) yield state.copyWith(mapReady: true);

  }
}
