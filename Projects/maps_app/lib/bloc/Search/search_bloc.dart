import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maps_app/models/search_result.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {

    if(event is OnActiveManualMarker) yield state.copyWith(seleccionManual: true);
    if(event is OnDeactiveManualMarker) yield state.copyWith(seleccionManual: false);


  }
}
