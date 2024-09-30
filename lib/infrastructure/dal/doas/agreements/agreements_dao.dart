import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dyno_sign/domain/core/interfaces/agreements/agreements_repository.dart';
import 'package:dyno_sign/infrastructure/dal/models/docs_model.dart';
import 'package:dyno_sign/infrastructure/dal/services/api_services/api_helper.dart';
import 'package:flutter/services.dart' show rootBundle;

class AgreementsDoa extends AgreementsRepository {
  final ApiHelper _apiHelper;

  AgreementsDoa(this._apiHelper);

  @override
  Future<List<DocsModel>> getAllAgreements() async {
    try {
      final jsonString = await rootBundle.loadString("assets/json/docs.json");
      List<dynamic> mapData = jsonDecode(jsonString);
      _apiHelper;

      final response =
          Response(data: mapData, statusCode: 200, requestOptions: RequestOptions(path: ''));

      final List<dynamic>? data = response.data;

      if (data != null) {
        return data.map((data) => DocsModel.fromMap(data)).toList();
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }
}
