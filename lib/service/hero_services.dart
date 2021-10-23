import 'package:dotaku/model/hero.dart';
import 'package:dotaku/service/service_exception.dart';
import 'package:dotaku/utils/constant.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<List<Heroes>> loadHero() async {
    try {
      var response = await http.get(Uri.parse(ApiRef.hero));
      if (response.statusCode != 200) {
        //error handle
        throw ServiceException.fromResponse(response);
      }
      return heroFromJson(response.body);
    } catch (exception) {
      rethrow;
    }
  }
}
