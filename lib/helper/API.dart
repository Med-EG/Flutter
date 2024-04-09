import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
 bool errCode=false;
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'There is a problem with status code${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url, required dynamic body, String? token,dynamic headers}) async {
    Map<String, String> headers = {};
   
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer$token'});
    }
    http.Response response = await http.post(Uri.parse(url),body: body);
    try{
    
    if (response.statusCode == 200) {
      errCode=false;
      
      Map<String, dynamic> data = jsonDecode(response.body);
      
      print(response.body);
      return data;
    }
    else if(response.statusCode==401||response.statusCode==404)
    {
      
      errCode =true;
       Map<String, dynamic> data = jsonDecode(response.body);
      
      print(response.body);
      return data;
    }
     else {
      print(response.body);
      throw Exception(
          'There is problem with status code${response.statusCode}with body${response.body}');
      } }
      on SocketException
      {}
      catch(error){
       
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

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
