import 'dart:convert';
import 'dart:ffi';

import 'package:budget/domain/model/remote/base_model.dart';
import 'package:budget/domain/model/remote/category/category_remote_model.dart';

class BudgetRemoteModel implements BaseModel {
  final List<CategoryRemoteModel>? categories;
  final int? budget;

  BudgetRemoteModel({this.categories, this.budget});

  factory BudgetRemoteModel.fromJson(Map<String, dynamic> json) =>
      BudgetRemoteModel(
          categories: ((json["categories"] as List).map((e) => CategoryRemoteModel.fromJson(e))
              .toList()),
          budget: json["budget"]);


  @override
  Map<String, dynamic> toJson() => {
        "categories": categories?.map((e) => e.toJson()),
        "budget": budget,
      };



}


