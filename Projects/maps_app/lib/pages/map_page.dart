import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/bloc/Location/location_bloc.dart';
import 'package:maps_app/pages/permissions_page.dart';
import '../bloc/Permissions/permission_bloc.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final permissionBloc = BlocProvider.of<PermissionBloc>(context);

    return Scaffold(
      body: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {
          permissionBloc.add(PermissionCheck());

          if (state is PermissionGpsDenied) return PermissionsPage();
          if (state is GpsDissable)
            return Center(
              child: Text('Gps Is needed to use the app'),
            );
          if (state is PermissionsAccepted) return MainMap();

          return Container();
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
    // TODO: implement dispose
    super.dispose();
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.finishFollow();
  }

  Widget createMap(MyLocation state){

    final location = state.location;

    if(!state.existLocation) return Text('Ubicando...');
    
    final initialPosition = CameraPosition(target: location,zoom: 15);

    return GoogleMap(initialCameraPosition: initialPosition,myLocationEnabled: true);
  }

}
