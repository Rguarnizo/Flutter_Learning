import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/bloc/Location/location_bloc.dart';
import 'package:maps_app/models/search_response.dart';
import 'package:maps_app/models/search_result.dart';
import 'package:maps_app/services/traffic_service.dart';

class SearchDestination extends SearchDelegate {
  @override
  final String searchFieldLabel;
  final TrafficService _trafficService;

  SearchDestination()
      : this.searchFieldLabel = 'Buscar...',
        this._trafficService = new TrafficService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear_outlined),
          onPressed: () {
            this.query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    final searchResult = SearchResult(cancel: true);

    return IconButton(
      icon: Icon(Icons.chevron_left),
      onPressed: () {
        this.close(context, searchResult);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final blocLocation = BlocProvider.of<LocationBloc>(context);

    this
        ._trafficService
        .getResultQueryParam(this.query.trim(), blocLocation.state.location);

    return _buildSuggestionsResult(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if(this.query.isEmpty){

    return ListView(
      children: [
        ListTile(
          leading: Icon(
            Icons.location_on,
          ),
          title: Text('Colocar ubicación Manualmente'),
          onTap: () {
            this.close(context, SearchResult(cancel: false, manual: true));
          },
        )
      ],
    );
      
    }

    return this._buildSuggestionsResult(context);

  }

  Widget _buildSuggestionsResult(BuildContext context) {

    if(this.query.isEmpty) return Container();

    final blocLocation = BlocProvider.of<LocationBloc>(context);

    return FutureBuilder(
      future: this
          ._trafficService
          .getResultQueryParam(this.query.trim(), blocLocation.state.location),
      builder: (context, AsyncSnapshot<SearchResponse> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final places = snapshot.data.features;

        return ListView.separated(
          separatorBuilder: (_, i) => Divider(),
          itemCount: places.length,
          itemBuilder: (context, i) => ListTile(title: Text(places[i].placeName),leading: Icon(Icons.place),subtitle: Text(places[i].placeName),onTap: () => print(places[i])),
        );
      },
    );
  }
}
