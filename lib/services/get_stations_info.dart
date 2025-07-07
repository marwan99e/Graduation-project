import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:evcharge/model/station_model.dart';

import '../helper/api.dart';

class StationsInfo {
  final dio = Dio();

  Future<List<StationModel>> getInfo() async {
    dynamic data = await Api().get(
        url:
            "https://evcharge.services/APIs/get_stations?user_lat=123&user_long=123");

    List<dynamic> listData = jsonDecode(data);
    List<StationModel> dataList = [];
    for (int i = 0; i < listData.length; i++) {
      dataList.add(StationModel.fromJson(listData[i]));
    }

    return dataList;
  }
}
