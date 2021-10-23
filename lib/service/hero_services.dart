import 'dart:convert';

import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/service_exception.dart';
import 'package:dotaku/utils/constant.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Heroes>> loadHero() async {
    try {
      var response = await http.get(Uri.parse(ApiRef.hero));
      if (response.statusCode != 200) {
        throw ServiceException.fromResponse(response);
      }
      return heroFromJson(response.body);
    } catch (exception) {
      rethrow;
    }
  }

  static Future<List<Heroes>> similarHero(String attr) async {
    try {
      var response = await http.get(Uri.parse(ApiRef.hero));
      List data = jsonDecode(response.body);
      // print(data.toString());

      if (response.statusCode != 200) {
        throw ServiceException.fromResponse(response);
      }
      List<Heroes> hasil = [];
      for (var item in data) {
        if (item['primary_attr'] == attr) {
          hasil.add(Heroes.fromJson(item));
        }
      }

      // List<Heroes> result = data.where((element) => element['primary_attr'] == attr).toList() as List<Heroes>;
      return hasil;
    } catch (exception) {
      rethrow;
    }
  }
}
