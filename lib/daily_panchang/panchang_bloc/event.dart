import 'package:flutter/foundation.dart';

abstract class PanchangEvent {}

class FetchPanchangEvent extends PanchangEvent {
  final int date, month, year;
  final String placeId;

  @override
  FetchPanchangEvent({
    @required this.date,
    @required this.month,
    @required this.year,
    @required this.placeId,
  });
}
