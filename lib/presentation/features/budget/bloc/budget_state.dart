import 'package:budget/domain/model/repo/budget/budget_repo_model.dart';

sealed class BudgetState {
  const BudgetState();
}

final class BudgetLoading extends BudgetState {}

final class BudgetLoaded extends BudgetState {
  final BudgetRepoModel budgetRepoModel;

  BudgetLoaded(this.budgetRepoModel);
}

final class BudgetError extends BudgetState {
  final Object exception;

  BudgetError(this.exception);
}
