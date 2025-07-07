import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final dio = Dio();
  Future<dynamic> get({required String url}) async {
    try {
      Response response = await dio.get(url);
      print(response.data);
      return response.data;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> queryParameters = {};

    if (token != null) {
      queryParameters.addAll({
        "Authorization": "Bearer $token",
      });
    }
    try {
      Response response = await dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );

      Map<String, dynamic> data = response.data;
      return data;
    } on Exception {
      throw Exception("error");
    }
  }
}
