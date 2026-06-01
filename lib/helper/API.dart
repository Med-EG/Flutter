import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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

 
  Future<dynamic> generateEncodings({
    required String url,
    required String folderPath,
    String? token,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    final body = jsonEncode({
      'folder_path': folderPath,
    });

    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

     if (response.statusCode == 200) {
      // Ensure the response is JSON
      if (response.headers['content-type']?.contains('application/json') ?? false) {
        final responseBody = jsonDecode(response.body);
        print(responseBody);
        return responseBody;
      } else {
        throw Exception('Expected JSON response but got ${response.headers['content-type']}');
      }
    } else {
      // Check if the response is JSON before trying to decode it
      if (response.headers['content-type']?.contains('application/json') ?? false) {
        final responseBody = jsonDecode(response.body);
        throw Exception(
          'Failed to generate encodings with status code ${response.statusCode}: ${responseBody['error']}');
      } else {
        throw Exception(
          'Failed to generate encodings with status code ${response.statusCode}: ${response.body}');
      }
  }
}

 Future<Map<String, dynamic>> uploadLatestImage({required String url}) async {
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final Directory uploadsDirectory =
        Directory('${appDirectory.path}/uploads');

    if (!await uploadsDirectory.exists()) {
      throw Exception('Uploads directory does not exist.');
    }

    List<FileSystemEntity> files = uploadsDirectory.listSync();
    files
        .sort((a, b) => b.statSync().modified.compareTo(a.statSync().modified));

    if (files.isEmpty) {
      throw Exception('No files found in the uploads directory.');
    }

    File latestFile = File(files.first.path);
    final Uri apiUrl = Uri.parse(url);
    final request = http.MultipartRequest('POST', apiUrl)
      ..files.add(await http.MultipartFile.fromPath('file', latestFile.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await http.Response.fromStream(response);
      return json.decode(responseData.body);
    } else {
      throw Exception('Failed to upload image');
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