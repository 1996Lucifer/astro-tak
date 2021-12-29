import 'package:astro_talks/astro_screen/astro_bloc/event.dart';
import 'package:astro_talks/astro_screen/astro_bloc/state.dart';
import 'package:astro_talks/astro_screen/data/astro_model.dart';
import 'package:astro_talks/astro_screen/data/astro_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AstroBloc extends Bloc<AstroEvent, AstroState> {
  AstroBloc(AstroState initialState) : super(initialState);
  AstroRepo astroRepo = AstroRepo();

  Stream<AstroState> mapEventToState(
    AstroEvent event,
  ) async* {
    if (event is FetchAstrologersEvent) {
      yield* _mapFetchAstrologerEventToState(event);
    }
  }

  Stream<AstroState> _mapFetchAstrologerEventToState(AstroEvent event) async* {
    if (event is FetchAstrologersEvent) {
      yield AstroLoadingState();
      try {
        List<AstrologersList> astrologersList =
            await astroRepo.fetchAstrologersList();
        yield AstroLoadedState(astrologersList: astrologersList);
      } catch (e) {
        yield AstroErrorState(errorCode: e.toString());
      }
    }
  }
}
