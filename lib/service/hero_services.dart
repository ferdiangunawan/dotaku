import 'dart:async';
import 'dart:convert';
import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/service_exception.dart';
import 'package:dotaku/utils/network/api.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Heroes>> loadHero() async {
    try {
      http.Response? response;
      response = await http.get(Uri.parse(ApiRef.hero)).timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException('The connection has timed out, Please try again!');
      });
      if (response.statusCode != 200) {
        throw ServiceException.fromResponse(response);
      }
      return heroFromJson(response.body);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Heroes>> similarHero(String attr) async {
    try {
      var response = await http.get(Uri.parse(ApiRef.hero)).timeout(const Duration(seconds: 5), onTimeout: () {
        throw TimeoutException('The connection has timed out, Please try again!');
      });
      List data = jsonDecode(response.body);

      if (response.statusCode != 200) {
        throw ServiceException.fromResponse(response);
      }
      List<Heroes> result = [];
      for (var item in data) {
        if (item['primary_attr'] == attr) {
          result.add(Heroes.fromJson(item));
        }
      }
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
