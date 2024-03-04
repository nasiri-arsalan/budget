import 'package:budget/common/mapper.dart';
import 'package:budget/domain/model/remote/budget/budget_remote_model.dart';
import 'package:budget/domain/model/remote/category/category_type.dart';
import 'package:budget/domain/model/repo/budget/budget_repo_model.dart';
import 'package:budget/domain/model/repo/category/category_repo_model.dart';

class BudgetMapper implements Mapper<BudgetRemoteModel, BudgetRepoModel> {
  @override
  BudgetRepoModel map(BudgetRemoteModel input) {
    return BudgetRepoModel(
        categories: input.categories
                ?.map((e) => CategoryRepoModel(
                    name: e.name ?? "",
                    type: CategoryType.getType(e.type ?? ""),
                    total: e.total ?? 0,
                    amount: e.amount ?? 0.0))
                .toList() ??
            [],
        budget: input.budget ?? 0);
  }
}
