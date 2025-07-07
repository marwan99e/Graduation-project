import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:evcharge/model/price_model.dart';

import '../helper/api.dart';

class PriceInfo {
  final dio = Dio();

  Future<PriceModel> getPrice({required double kWh}) async {
    dynamic data = await Api()
        .get(url: "https://evcharge.services/APIs/calculator?amount=$kWh");

    List<dynamic> listData = jsonDecode(data);
    PriceModel priceModel = PriceModel.fromJson(listData[0]);
    print(priceModel);

    return priceModel;
  }
}
