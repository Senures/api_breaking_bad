import 'package:breaking_bad_api/entity/api_model.dart';
import 'package:breaking_bad_api/utils/const.dart';
import 'package:dio/dio.dart';

class DetailService {
  Dio dio = Dio();

  Future<List<Model>?> getCharacterDetail(int characterId) async {
    String url = CHARACTER_ID.replaceAll("CHAR_ID", characterId.toString());
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      Iterable data = response.data;
      return data.map((e) => Model.fromJson(e)).toList();
    }
  }
}
