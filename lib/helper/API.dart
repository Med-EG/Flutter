import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Api {
  bool errCode = false;
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else if (response.statusCode == 404 || response.statusCode == 400) {
      throw Exception('Error: ${response.statusCode} ${response.reasonPhrase}');
    } else if (response.statusCode == 429) {
      throw ApiException(response.statusCode, response.body);
    } else {
      throw Exception(
          'There is a problem with status code${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', 
      });
    } else {
      headers = {'Content-Type': 'application/json'};
    }
    const int maxRetries = 5;
    const Duration initialRetryDelay = Duration(seconds: 1);
    int retries = 0;
    Duration retryDelay = initialRetryDelay;

    while (true) {
      try {
        http.Response response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          return jsonDecode(response.body);
        } else if (response.statusCode == 401 || response.statusCode == 404) {
          throw Exception(
              'Error: ${response.statusCode} ${response.reasonPhrase}');
        } else if (response.statusCode == 429) {
          if (retries < maxRetries) {
            retries++;
            await Future.delayed(retryDelay);
            retryDelay *= 2; // Exponential backoff
          } else {
            throw ApiException(response.statusCode, response.body);
          }
        } else {
          throw Exception(
              'There is a problem with status code ${response.statusCode} with body ${response.body}');
        }
      } on SocketException {
        throw Exception('SocketException occurred');
      } catch (error) {
        throw Exception('An error occurred: $error');
      }
    }
  }

  Future<dynamic> delete({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', 
      });
    } else {
      headers = {'Content-Type': 'application/json'};
    }

    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      return null;
    } else if (response.statusCode == 404 || response.statusCode == 400) {
      throw Exception('Error: ${response.statusCode} ${response.reasonPhrase}');
    } else {
      throw Exception(
          'There is a problem with status code${response.statusCode}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }

    print('url = $url body= $body token= $token');
    http.Response responce =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (responce.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(responce.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'There is problem with status code${responce.statusCode}with body${responce.body}');
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final String message;

  ApiException(this.statusCode, this.message);

  @override
  String toString() {
    return 'ApiException: Status Code $statusCode - $message';
  }
}
