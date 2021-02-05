import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, MyLocation> {
  LocationBloc() : super(MyLocation(location: LatLng(0,0)));

  StreamSubscription<Position> _positionSubscription;
  

  @override
  Stream<MyLocation> mapEventToState(
    LocationEvent event,
  ) async* {
    if(event is OnLocationChange){ 
      yield state.copyWith(location: event.location,existLocation: true);
    }
    
  }

  void initFollow(){
    
    _positionSubscription = 
    GeolocatorPlatform.instance.getPositionStream(
      desiredAccuracy : LocationAccuracy.best,
      distanceFilter: 10,
    ).listen((position) {      
      final location = new LatLng(position.latitude, position.longitude);
      add(OnLocationChange(location));
    });
  }

  void finishFollow(){
    this._positionSubscription?.cancel();
  }

}
