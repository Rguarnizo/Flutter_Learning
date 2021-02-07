import 'package:flutter/material.dart';
import 'package:maps_app/models/search_result.dart';

class SearchDestination extends SearchDelegate {
  @override
  final String searchFieldLabel;

  SearchDestination() : this.searchFieldLabel = 'Buscar...';

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
