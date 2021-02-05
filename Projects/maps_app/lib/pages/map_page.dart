import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/bloc/Location/location_bloc.dart';
import 'package:maps_app/bloc/Map/map_bloc.dart';
import 'package:maps_app/pages/permissions_page.dart';
import 'package:maps_app/widgets/widgets.dart';
import '../bloc/Permissions/permission_bloc.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final permissionBloc = BlocProvider.of<PermissionBloc>(context);
    permissionBloc.add(PermissionCheck());
    return Scaffold(
      body: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {                    
          if (state is PermissionGpsDenied) return PermissionsPage();
          return MainMap();
        },
      ),
    );
  }
}

class MainMap extends StatefulWidget {
  const MainMap({
    Key key,
  }) : super(key: key);

  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  @override
  void initState() {
    super.initState();
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.initFollow();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, MyLocation>(
      builder: (_, state) {
        return createMap(state);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.finishFollow();
  }

  Widget createMap(MyLocation state) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final location = state.location;

    if (!state.existLocation) return Text('Ubicando...');

    final initialPosition = CameraPosition(target: location, zoom: 15);
    mapBloc.add(OnLocationUpdate(initialPosition.target));
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GoogleMap(
          initialCameraPosition: initialPosition,          
          onMapCreated: mapBloc.initMap,
          buildingsEnabled: false,
          polylines: mapBloc.state.polylines.values.toSet(),
        ),
        BottomActions(),
      ],
    );
  }
}

class BottomActions extends StatelessWidget {
  const BottomActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final blocLocation = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return BlocBuilder<PermissionBloc, PermissionState>(
      builder: (context, state) {
        //TODO: Create a widget for gps error.
        if(state is GpsDissable) return Container(color: Colors.red, width: 50,height: 50,);
        if(state is PermissionsAccepted) return MyLocationButton(onPress: () => mapBloc.moveCam(blocLocation.state.location),);
      },
    );
  }
}
