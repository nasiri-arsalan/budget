import '../category/category_repo_model.dart';

class BudgetRepoModel {
  final List<CategoryRepoModel>? categories;
  final int? budget;

  BudgetRepoModel({this.categories, this.budget});

  double sumAmount() {
    double sum = 0;
    categories?.forEach((element) {
      sum += element.amount;
    });
    return sum;
  }
}
