import 'dart:convert';

import 'package:webtoon_platform/models/webtoon.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "/today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse(baseUrl + today);
    final response = await http.get(url);
    List<WebtoonModel> webtoonIstances = [];

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        webtoonIstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonIstances;
    }
    throw Error();
  }
}
