import 'package:budget/data/mapper/budget/budget_mapper.dart';
import 'package:budget/data/network/api/budget_api.dart';
import 'package:budget/data/network/rest_api.dart';
import 'package:budget/data/repositories/budget_repository_impl.dart';
import 'package:budget/domain/repositories/budget_repository.dart';
import 'package:budget/domain/use_case/budget/budget_use_case.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator.registerSingleton<RestApi>(RestApi());
  serviceLocator.registerFactory<BudgetApi>(
      () => BudgetApi(serviceLocator.get<RestApi>()));

  serviceLocator.registerFactory(() => BudgetMapper());

  serviceLocator.registerFactory<BudgetRepository>(() => BudgetRepositoryImpl(
      serviceLocator.get<BudgetApi>(),
      budgetMapper: serviceLocator.get<BudgetMapper>()));

  serviceLocator.registerFactory<BudgetUseCase>(
      () => BudgetUseCase(serviceLocator.get<BudgetRepository>()));
}
