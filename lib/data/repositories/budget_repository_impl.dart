import 'package:budget/data/network/api/budget_api.dart';
import 'package:budget/domain/model/repo/budget/budget_repo_model.dart';
import 'package:budget/domain/repositories/budget_repository.dart';

import '../mapper/budget/budget_mapper.dart';

class BudgetRepositoryImpl implements BudgetRepository {
  final BudgetApi _api;
  final BudgetMapper budgetMapper;

  BudgetRepositoryImpl(this._api, {required this.budgetMapper});

  @override
  Future<BudgetRepoModel> getBudget() async {
    var response = await _api.getBudget();
    return budgetMapper.map(response);
  }
}
