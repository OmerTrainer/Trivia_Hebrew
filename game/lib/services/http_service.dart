// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {
  HttpService._internal();
  factory HttpService() {
    return _instance;
  }

  static final HttpService _instance = HttpService._internal();

  final String baseUrl = BaseUrlConnection.baseUrl;

  static int? _userRoleId;

  String _accessToken = '';

  static void setRoleId(int? newRoleId) {
    _userRoleId = newRoleId;
  }

  void setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  Map<String, String> _getRequestHeaders() {
    return {
      'Authorization': 'Bearer $_accessToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  Future<http.Response> base(
      RecognizerCallback<Future<http.Response>> baseFunc, BuildContext ctx) {
    return baseFunc().then((res) async {
      if (res.statusCode == 401) {}
      if (res.statusCode == 409) {}
      return res;
    });
  }

  Future<http.Response> _deleteRequest(String endPoint, dynamic data) {
    return http.delete(
      Uri.parse('$baseUrl/$endPoint/'),
      headers: _getRequestHeaders(),
      body: data,
    );
  }

  // ignore: unused_element
  Future<http.Response> delete(
      String endPoint, dynamic data, BuildContext ctx) {
    return base(() => _deleteRequest(endPoint, data), ctx);
  }

  Future<http.Response> _putRequest(String endPoint, dynamic data) {
    return http.put(
      Uri.parse('$baseUrl/$endPoint/'),
      headers: _getRequestHeaders(),
      body: data,
    );
  }

  // ignore: unused_element
  Future<http.Response> put(String endPoint, dynamic data, BuildContext ctx) {
    return base(() => _putRequest(endPoint, data), ctx);
  }

  Future<http.Response> _getRequest(String endPoint) {
    return http.get(Uri.parse('$baseUrl/$endPoint?userRoleId=$_userRoleId'),
        headers: _getRequestHeaders());
  }

  Future<http.Response> get(String endPoint, BuildContext ctx) {
    return base(() => _getRequest(endPoint), ctx);
  }

  Future<http.Response> _postRequest(String endPoint, dynamic data) {
    return http.post(
      Uri.parse('$baseUrl/$endPoint'),
      headers: _getRequestHeaders(),
      encoding: Encoding.getByName("utf-8"),
      body: jsonEncode(data),
    );
  }

  Future<http.Response> post(String endPoint, dynamic data, BuildContext ctx) {
    return base(() => _postRequest(endPoint, data), ctx);
  }
}
