import 'package:astro_talks/daily_panchang/data/location_model.dart';
import 'package:flutter/foundation.dart';

class LocationState {}

class LocationInitialState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedState extends LocationState {
  List<LocationsList> locationsList;
  LocationLoadedState({@required this.locationsList});
}

class LocationErrorState extends LocationState {
  final String errorCode;
  LocationErrorState({this.errorCode});
}
