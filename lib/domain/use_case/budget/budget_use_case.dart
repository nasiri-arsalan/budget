import 'package:budget/common/use_case.dart';
import 'package:budget/domain/model/repo/budget/budget_repo_model.dart';
import 'package:budget/domain/repositories/budget_repository.dart';

class BudgetUseCase implements UseCase<String, BudgetRepoModel> {
  final BudgetRepository _repository;

  BudgetUseCase(this._repository);

  @override
  Future<BudgetRepoModel> invoke(String value) {
    return _repository.getBudget();
  }
}
