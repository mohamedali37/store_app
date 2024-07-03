import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('your status code is = ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    // ignore: avoid_print
    print('url = $url , body = $body , token = $token');
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'your status code is = ${response.statusCode} and body = ${response.body}');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    // ignore: avoid_print
    print('url = $url , body = $body , token = $token');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'your status code is = ${response.statusCode} and body = ${response.body}');
    }
  }
}