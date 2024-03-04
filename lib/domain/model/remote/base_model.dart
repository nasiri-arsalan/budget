import 'package:budget/domain/model/remote/budget/budget_remote_model.dart';

abstract class BaseModel {
  static T fromJson<T extends BaseModel>(Map<String, dynamic> json) {
    switch (T) {
      case const (BudgetRemoteModel):
        return BudgetRemoteModel.fromJson(json) as T;
      default:
        throw UnimplementedError();
    }
  }

  Map<String, dynamic> toJson();
}
