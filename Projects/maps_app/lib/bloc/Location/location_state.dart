part of 'location_bloc.dart';

@immutable
class MyLocation {
  final bool follow;
  final bool existLocation;
  final LatLng location;

  MyLocation({this.follow = true, this.existLocation = false, this.location});

  MyLocation copyWith({
    bool follow,
    bool existLocation,
    LatLng location,
  }) =>
      MyLocation(
          follow: follow ?? this.follow,
          existLocation: existLocation ?? this.existLocation,
          location: location ?? this.location);
}
