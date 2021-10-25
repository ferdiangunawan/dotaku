import 'dart:convert';

import 'package:http/http.dart';

class ServiceException implements Exception {
  String? message;
  int? status;

  ServiceException([this.message]);

  ServiceException.fromResponse(Response res) {
    String? msg, prefix;
    try {
      Map<String, dynamic> jsonData = jsonDecode(res.body);
      if (jsonData.containsKey('error')) {
        msg = jsonData['error']['message'];
      }
    } catch (error) {
      rethrow;
    }

    // ignore: unnecessary_null_comparison
    if (res == null) {
      prefix = 'Failed to connect to server';
    } else {
      status = res.statusCode;
      switch (res.statusCode) {
        case 400:
          prefix = 'Invalid request';
          break;
        case 401:
          prefix = 'Unauthenticated';
          break;
        case 403:
          prefix = 'Unauthorized';
          break;
        case 404:
          prefix = 'Data not found';
          break;
        case 500:
          prefix = 'Internal error';
          break;
        default:
          prefix = null;
      }

      if (prefix != null && msg != null) {
        message = '$prefix: $msg';
      } else if (msg != null || prefix != null) {
        message = '${prefix ?? ''}${msg ?? ''}';
      } else {
        message = 'Unknown error occurred with status code ${res.statusCode}';
      }
    }
  }
}
