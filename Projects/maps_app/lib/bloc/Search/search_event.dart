part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}


class OnActiveManualMarker extends SearchEvent{

}

class OnDeactiveManualMarker extends SearchEvent{
  
}

class OnAddHistorial extends SearchEvent{

  final SearchResult _searchResult;

  OnAddHistorial(this._searchResult);
  
}