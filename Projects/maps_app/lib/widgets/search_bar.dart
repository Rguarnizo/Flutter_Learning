part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc,SearchState>(
      builder: (context, state) {
        return state.seleccionManual? Container():_buildSearchBar(context);
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return FadeInDown(
      duration: Duration(milliseconds: 300),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          width: size.width,
          child: GestureDetector(
            onTap: () async {
              final historial = context.read<SearchBloc>().state.historial;
              final result = await showSearch(
                  context: context, delegate: SearchDestination(historial));
              returnSearch(context, result);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: Offset(0, 5))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '¿A dónde iremos hoy?',
                    style: TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void returnSearch(BuildContext context, SearchResult result) async {
    final blocSearch = BlocProvider.of<SearchBloc>(context);

    if (result.cancel) return;
    if (result.manual){ blocSearch.add(OnActiveManualMarker());
      return;
    }

    final trafficService = TrafficService();

    final mapaBloc = BlocProvider.of<MapBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);

    final end = result.positions;
    final start = locationBloc.state.location;

    final drivingResponse = await trafficService.getCoordsStartAndEnd(start, end);

    final geometry = drivingResponse.routes[0].geometry;
    final duration = drivingResponse.routes[0].duration;
    final distance = drivingResponse.routes[0].distance;

    final points = Poly.Polyline.Decode(encodedString: geometry,precision: 6);

    final List<LatLng> routeCoord = points.decodedCoords.map((e) => LatLng(e[0],e[1])).toList();

    mapaBloc.add(OnCreateRouteStartEnd(distance: distance,duration: duration,routeCoords: routeCoord));

   final  searchBloc =  BlocProvider.of<SearchBloc>(context);

   searchBloc.add(OnAddHistorial(result));



    
  }
}
