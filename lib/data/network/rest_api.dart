import 'dart:convert';

import 'package:budget/domain/model/remote/base_model.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../domain/model/remote/budget/budget_remote_model.dart';

class RestApi {
  Future<T> get<T extends BaseModel>(String path) async {
    return await _decode(path);
  }

  Future<String> _getFile(String path) async {
    const String basePath = "assets/json";
    String response = await rootBundle.loadString('$basePath/$path');
    return response;
  }

  Future<T> _decode<T extends BaseModel>(String path) async {
    final data = jsonDecode(await _getFile(path));
    return BaseModel.fromJson(data);
  }
}
