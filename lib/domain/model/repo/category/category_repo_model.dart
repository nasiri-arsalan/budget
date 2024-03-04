import 'package:budget/domain/model/remote/category/category_type.dart';

class CategoryRepoModel {
  final String name;
  final CategoryType type;
  final int total;
  final double amount;

  CategoryRepoModel(
      {required this.name,
      required this.type,
      required this.total,
      required this.amount});
}
