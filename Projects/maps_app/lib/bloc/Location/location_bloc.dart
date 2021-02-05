import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(MyLocation());

  StreamSubscription<Position> _positionSubscription;
  

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    
  }

  void initFollow(){
    
    this._positionSubscription = 
    GeolocatorPlatform.instance.getPositionStream(
      desiredAccuracy : LocationAccuracy.bestForNavigation,
      distanceFilter: 10,
    ).listen((position) {
      print(position);
    });
  }

  void finishFollow(){
    this._positionSubscription?.cancel();
  }

}
