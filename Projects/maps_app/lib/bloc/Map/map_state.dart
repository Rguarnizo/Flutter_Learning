part of 'map_bloc.dart';

@immutable
class MapInitial{
  final bool mapReady;

  MapInitial({this.mapReady = false});

   MapInitial copyWith({
    bool mapReady
  }) => MapInitial(mapReady: mapReady?? mapReady);
}
