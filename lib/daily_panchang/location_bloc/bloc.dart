import 'package:astro_talks/daily_panchang/data/location_model.dart';
import 'package:astro_talks/daily_panchang/data/location_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(LocationState initialState) : super(initialState);
  LocationRepo locationRepo = LocationRepo();

  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is FetchLocationEvent) {
      yield* _mapFetchLocationDetailsToState(event);
    }
  }

  Stream<LocationState> _mapFetchLocationDetailsToState(
      LocationEvent event) async* {
    if (event is FetchLocationEvent) {
      yield LocationLoadingState();
      try {
        List<LocationsList> _locationsList =
            await locationRepo.fetchLocationsList(
          event.inputPlace,
        );
        yield LocationLoadedState(locationsList: _locationsList);
      } catch (e) {
        yield LocationErrorState(errorCode: e.toString());
      }
    }
  }
}
