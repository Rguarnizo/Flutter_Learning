import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

class SearchResult {
  final bool cancel;
  final bool manual;
  final LatLng positions;
  final String nombreDestino;
  final String description;

  SearchResult({
      @required this.cancel,
      this.manual,
      this.positions,
      this.nombreDestino,
      this.description
      });
}
