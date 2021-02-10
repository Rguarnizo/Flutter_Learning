import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_app/bloc/Location/location_bloc.dart';
import 'package:maps_app/models/search_result.dart';
import 'package:maps_app/services/traffic_service.dart';

class SearchDestination extends SearchDelegate {
  @override
  final String searchFieldLabel;
  final TrafficService _trafficService;

  SearchDestination() : this.searchFieldLabel = 'Buscar...', this._trafficService = new TrafficService();

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

    this._trafficService.getResultQueryParam(this.query.trim(),blocLocation.state.location);


    return Text('Build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(
            Icons.location_on,
          ),
          title: Text('Colocar ubicación Manualmente'),
          onTap: () {
            this.close(context, SearchResult(cancel: false,manual: true));
          },
        )
      ],
    );
  }
}
