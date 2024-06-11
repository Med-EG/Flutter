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

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body), 
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        throw Exception(
            'Error: ${response.statusCode} ${response.reasonPhrase}');
      } else {
        throw Exception(
            'There is a problem with status code ${response.statusCode} with body ${response.body}');
      }
    } on SocketException {
      // Handle SocketException
      throw Exception('SocketException occurred');
    } catch (error) {
      // Handle other errors
      throw Exception('An error occurred: $error');
    }
  }

  Future<dynamic> put({
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

    http.Response response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        throw Exception(
          'Error: ${response.statusCode} ${response.reasonPhrase}',
        );
      } else {
        throw Exception(
          'There is a problem with status code ${response.statusCode} with body ${response.body}',
        );
      }
    } on SocketException {
      throw Exception('SocketException occurred');
    } catch (error) {
      throw Exception('An error occurred: $error');
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
}
