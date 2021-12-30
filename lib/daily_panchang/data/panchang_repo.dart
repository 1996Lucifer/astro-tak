import 'dart:convert';

import 'package:astro_talks/utils/constants.dart';
import 'package:dio/dio.dart';

import 'panchang_model.dart';

class PanchangRepo {
  Future<PanchangDetail> fetchPanchangDetails(
      int date, int month, int year, String placeId) async {
    var response = await Dio().post(Constants.fetchPanchangDetails,
        data: json.encode({
          "day": date,
          "month": month,
          "year": year,
          "placeId": placeId,
        }));
    if (response.statusCode == 200) {
      PanchangDetail panchangDetails = PanchangDetail.fromJson(response.data['data']);
      return panchangDetails;
    } else {
      throw Exception();
    }
  }
}
