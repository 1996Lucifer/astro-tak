import 'package:astro_talks/daily_panchang/data/panchang_model.dart';
import 'package:astro_talks/daily_panchang/data/panchang_repo.dart';
import 'package:astro_talks/daily_panchang/panchang_bloc/event.dart';
import 'package:astro_talks/daily_panchang/panchang_bloc/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PanchangBloc extends Bloc<PanchangEvent, PanchangState> {
  PanchangBloc(PanchangState initialState) : super(initialState);
  PanchangRepo panchangRepo = PanchangRepo();

  Stream<PanchangState> mapEventToState(
    PanchangEvent event,
  ) async* {
    if (event is FetchPanchangEvent) {
      yield* _mapFetchPanchangDetailsToState(event);
    }
  }

  Stream<PanchangState> _mapFetchPanchangDetailsToState(
      PanchangEvent event) async* {
    if (event is FetchPanchangEvent) {
      yield PanchangLoadingState();
      try {
        PanchangDetail panchangDetail = await panchangRepo.fetchPanchangDetails(
          event.date,
          event.month,
          event.year,
          event.placeId,
        );
        yield PanchangLoadedState(panchangDetail: panchangDetail);
      } catch (e) {
        yield PanchangErrorState(errorCode: e.toString());
      }
    }
  }
}
