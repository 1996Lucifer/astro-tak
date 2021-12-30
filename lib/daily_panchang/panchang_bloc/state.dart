import 'package:astro_talks/daily_panchang/data/panchang_model.dart';
import 'package:flutter/foundation.dart';

class PanchangState {}

class PanchangInitialState extends PanchangState {}

class PanchangLoadingState extends PanchangState {}

class PanchangLoadedState extends PanchangState {
  PanchangDetail panchangDetail;
  PanchangLoadedState({@required this.panchangDetail});
}

class PanchangErrorState extends PanchangState {
  final String errorCode;
  PanchangErrorState({this.errorCode});
}
