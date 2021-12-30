import 'package:astro_talks/utils/constants.dart';
import 'package:dio/dio.dart';

import 'location_model.dart';

class LocationRepo {
  Future<List<LocationsList>> fetchLocationsList(String inputPlace) async {
    var response =
        await Dio().get(Constants.fetchLocationsDetails, queryParameters: {
      'inputPlace': inputPlace,
    });
    if (response.statusCode == 200) {
      List<LocationsList> panchangDetails =
          LocationModel.fromJson(response.data).data;
      return panchangDetails;
    } else {
      throw Exception();
    }
  }
}
