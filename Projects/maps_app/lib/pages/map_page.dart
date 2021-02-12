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
    return Scaffold(      
      body: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {                    
          //* ADD EVENT TO BLOC TO CHECK IF ALL PERMISIONS IS GARANTED
          permissionBloc.add(PermissionCheck());

          //* Check permissions, if not garanted send it to a page to garanted permissions
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
    //* Active Stream Position subscription to emit the position if this change
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
    //* When widget is dispose, cancel the subscription to stream.
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
          myLocationEnabled: true,
          onMapCreated: mapBloc.initMap,        
          zoomControlsEnabled: false,
          compassEnabled: false,
          myLocationButtonEnabled: false,
          polylines: mapBloc.state.polylines.values.toSet(),
          markers: mapBloc.state.markers.values.toSet(),
          onCameraMove: (position) => mapBloc.add(OnMoveMap(position.target)),
          
        ),
        Positioned(top: 20,child: SearchBar()),
        ManualMarker(),
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
        if(state is PermissionsAccepted) return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyLocationButton(onPress: () => mapBloc.moveCam(blocLocation.state.location),),
            MyFollowLocationButton(onPress:() => mapBloc.add(OnFollowLocation())),
            MyRouteButton(onPress: () => mapBloc.add(OnMarkRoute())),
          ],
        );
      },
    );
  }
}
