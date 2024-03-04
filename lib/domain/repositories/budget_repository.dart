import 'package:budget/domain/model/repo/budget/budget_repo_model.dart';

abstract class BudgetRepository {
  Future<BudgetRepoModel> getBudget();
}
