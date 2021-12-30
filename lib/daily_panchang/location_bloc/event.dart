import 'package:flutter/foundation.dart';

abstract class LocationEvent {}

class FetchLocationEvent extends LocationEvent {
  final String inputPlace;

  @override
  FetchLocationEvent({
    @required this.inputPlace,
  });
}
