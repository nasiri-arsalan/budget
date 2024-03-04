import 'package:budget/data/network/rest_api.dart';
import 'package:budget/domain/model/remote/budget/budget_remote_model.dart';

class BudgetApi {
  final RestApi _restApi;

  BudgetApi(this._restApi);

  Future<BudgetRemoteModel> getBudget() => _restApi.get("data.json");
}
