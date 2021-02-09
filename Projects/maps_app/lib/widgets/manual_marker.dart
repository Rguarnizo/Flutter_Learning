part of 'widgets.dart';

class ManualMarker extends StatelessWidget {
  const ManualMarker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return state.seleccionManual? _BuildMarker(size: size):Container();
      },
    );
  }
}

class _BuildMarker extends StatelessWidget {
  const _BuildMarker({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {

    final blocSearch = BlocProvider.of<SearchBloc>(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          top: 70,
          left: 20,
          child: FadeInLeft(
            duration: Duration(milliseconds: 500),
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black45,
                ),
                onPressed: () => blocSearch.add(OnDeactiveManualMarker()),
              ),
            ),
          ),
        ),
        Transform.translate(
            offset: Offset(0, -15),
            child: Center(
              child: BounceInDown(
                child: Icon(
                  Icons.location_on,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            )),
        Positioned(
          bottom: 80,
          child: FadeIn(
            duration: Duration(milliseconds: 500),
            child: MaterialButton(          
                minWidth: size.width - 120,
                onPressed: () => this.calcularDestino(context),
                child: Text(
                  'Confirmar destino',
                  style: TextStyle(color: Colors.black),
                ),
                color: Colors.white,
              ),
          ),
        ),
        
      ],
    );
  }

  void calcularDestino(BuildContext context) async {

    final blocMyLocation = BlocProvider.of<LocationBloc>(context);
    final blocMap = BlocProvider.of<MapBloc>(context);


    final trafficService = TrafficService();
    final start = blocMyLocation.state.location;
    final end   = blocMap.state.centralLocation;

      final trafficReponse = await trafficService.getCoordsStartAndEnd(start, end);
      final geometry = trafficReponse.routes[0].geometry;
      final duration = trafficReponse.routes[0].duration;
      final distance = trafficReponse.routes[0].distance;

      //Decode polylines 
      final points = Poly.Polyline.Decode(encodedString: geometry,precision: 6).decodedCoords;

      final List<LatLng> routeCoords = points.map((e) => LatLng(e[0], e[1])).toList();

      
    
  }

}
