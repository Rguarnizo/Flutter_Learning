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
      children: [
        Positioned(
          top: 70,
          left: 20,
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
        Transform.translate(
            offset: Offset(0, -15),
            child: Center(
              child: Icon(
                Icons.location_on,
                size: 50,
                color: Colors.white,
              ),
            )),
        Positioned(
          bottom: 70,
          left: 40,
          child: MaterialButton(
            minWidth: size.width - 120,
            onPressed: () => null,
            child: Text(
              'Confirmar destino',
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
