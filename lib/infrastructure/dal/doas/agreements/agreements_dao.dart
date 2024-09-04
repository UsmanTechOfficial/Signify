import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dyno_sign/infrastructure/dal/models/docs_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class AgreementsRepository {
  Future<List<DocsModel>> getAllAgreements() async {
    try {
      final response = await rootBundle.loadString("assets/json/docs.json");

      List<dynamic> result = jsonDecode(response);

      try {
        return result.map((data) => DocsModel.fromMap(data)).toList();
      } catch (e) {
        print(e);
      }
    } catch (e) {
      rethrow;
    }
    return [];
  }
}
