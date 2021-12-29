import 'package:astro_talks/astro_screen/data/astro_model.dart';
import 'package:flutter/foundation.dart';

class AstroState {}

class AstroInitialState extends AstroState {}

class AstroLoadingState extends AstroState {}

class AstroLoadedState extends AstroState {
  List<AstrologersList> astrologersList;
  AstroLoadedState({@required this.astrologersList});
}

class AstroErrorState extends AstroState {
  final String errorCode;
  AstroErrorState({this.errorCode});
}
