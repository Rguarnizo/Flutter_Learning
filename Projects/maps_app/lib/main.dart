import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/bloc/Map/map_bloc.dart';
import 'package:maps_app/bloc/Search/search_bloc.dart';
import 'package:maps_app/pages/map_page.dart';
import 'package:maps_app/pages/permissions_page.dart';
import 'package:maps_app/pages/test_marker_page.dart';
import 'bloc/Location/location_bloc.dart';
import 'bloc/Permissions/permission_bloc.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PermissionBloc()),
        BlocProvider(create: (_) => LocationBloc()),
        BlocProvider(create: (_) => MapBloc()),
        BlocProvider(create: (_) => SearchBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: {
          'permissions': (context) => PermissionsPage(),
        },
        home: TestMarkerPage(),
      ),
    );
  }
}