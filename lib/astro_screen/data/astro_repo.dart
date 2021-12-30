import 'package:astro_talks/astro_screen/data/astro_model.dart';
import 'package:astro_talks/utils/constants.dart';
import 'package:dio/dio.dart';

class AstroRepo {
  Future<List<AstrologersList>> fetchAstrologersList() async {
    var response = await Dio().get(Constants.fetchAstrologerList);
    if (response.statusCode == 200) {
      List<AstrologersList> astrologers =
          AstrologerModel.fromJson(response.data).data;
      return astrologers;
    } else {
      throw Exception();
    }
  }
}
