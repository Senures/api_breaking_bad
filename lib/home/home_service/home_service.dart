import 'package:breaking_bad_api/entity/api_model.dart';
import 'package:breaking_bad_api/utils/const.dart';
import 'package:dio/dio.dart';

class HomeService {
  Dio dio = Dio();

  Future<List<Model>?> fetchHomeApi() async {
    String url = CHARACTERS;
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      Iterable data = response.data;
      return data.map((e) => Model.fromJson(e)).toList();
    }
  }

  Future<List<Model>?> fetchSearch(String text) async {
    String url = CHARACTER_SEARCH.replaceAll("NAME", text);
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      Iterable data = response.data;
      return data.map((e) => Model.fromJson(e)).toList();
    }
  }
}
