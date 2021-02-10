import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/bloc/Location/location_bloc.dart';
import 'package:maps_app/bloc/Map/map_bloc.dart';
import 'package:maps_app/bloc/Search/search_bloc.dart';
import 'package:maps_app/helpers/helpers.dart';
import 'package:maps_app/models/search_result.dart';
import 'package:maps_app/search/search_destination.dart';
import 'package:maps_app/services/traffic_service.dart';
import 'package:polyline/polyline.dart' as Poly;

import 'package:meta/meta.dart';

part 'my_location_button.dart';
part 'manual_marker.dart';
part 'my_route_button.dart';
part 'my_follow_location.dart';
part 'search_bar.dart';
