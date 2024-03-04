import 'package:budget/di/service_locator.dart';
import 'package:budget/domain/model/remote/category/category_type.dart';
import 'package:budget/domain/model/repo/category/category_repo_model.dart';
import 'package:budget/domain/use_case/budget/budget_use_case.dart';
import 'package:budget/presentation/features/budget/bloc/budget_bloc.dart';
import 'package:budget/presentation/features/budget/bloc/budget_event.dart';
import 'package:budget/presentation/features/budget/bloc/budget_state.dart';
import 'package:budget/presentation/features/budget/ui/widgets/app_bar_budget.dart';
import 'package:budget/presentation/features/budget/ui/widgets/budget_chart.dart';
import 'package:budget/presentation/features/budget/ui/widgets/budget_truck.dart';
import 'package:budget/presentation/features/budget/ui/widgets/category.dart';
import 'package:budget/presentation/features/budget/ui/widgets/new_category.dart';
import 'package:budget/presentation/features/budget/ui/widgets/vertical_space.dart';
import 'package:budget/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

import '../../../utils/strings.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BudgetBloc>(
        create: (context) =>
            BudgetBloc(budgetUseCase: serviceLocator.get<BudgetUseCase>()),
        child: const _BudgetPage());
  }
}

class _BudgetPage extends StatelessWidget {
  const _BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BudgetBloc>().add(BudgetStarted());
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: const AppBarBudget(),
      body: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) {
          if (state is BudgetLoading) {
            return const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: CircularProgressIndicator(),
            );
          }
          if (state is BudgetLoaded) {
            return Column(
              children: [
                const VerticalSpace(),
                BudgetChart(
                  budget: state.budgetRepoModel.budget ?? 0,
                  sumAmount: state.budgetRepoModel.sumAmount(),
                  segments: _createSegments(
                      state.budgetRepoModel.categories ?? [],
                      state.budgetRepoModel.budget ?? 0),
                ),
                const VerticalSpace(),
                const BudgetTruck(text: Strings.yoursBudgetsAreOnTruck),
                const VerticalSpace(),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          if (index ==
                              state.budgetRepoModel.categories?.length) {
                            return const NewCategory();
                          } else {
                            var item = state.budgetRepoModel.categories?[index];
                            return CategoryItem(
                              name: item?.name ?? "",
                              type: item?.type ?? CategoryType.unknown,
                              total: item?.total ?? 0,
                              amount: item?.amount ?? 0.0,
                            );
                          }
                        },
                        separatorBuilder: (context, index) {
                          return const VerticalSpace();
                        },
                        itemCount:
                            (state.budgetRepoModel.categories?.length ?? 0) +
                                1))
              ],
            );
          }
          if (state is BudgetError) {
            return Container(
              color: Colors.white,
              child: Text(state.exception.toString()),
            );
          }
          return Container(
            color: Colors.white,
            child: const Text("Exception"),
          );
        },
      ),
    );
  }

  List<GaugeSegment> _createSegments(
      List<CategoryRepoModel> categories, int budget) {
    double from = 0.0;
    return categories.map((e) {
      var segment = GaugeSegment(
        from: from,
        to: from + _calculateToPosition(budget, e.amount),
        color: _getProgressColor(e.type),
        cornerRadius: const Radius.circular(15),
      );
      from = segment.to;
      return segment;
    }).toList();
  }

  double _calculateToPosition(int budget, double amount) {
    return (amount * 100) / budget;
  }

  Color _getProgressColor(CategoryType type) {
    switch (type) {
      case CategoryType.transport:
        return MyColors.green;
      case CategoryType.entertainment:
        return MyColors.orange;
      case CategoryType.security:
        return MyColors.purple;
      case CategoryType.unknown:
        return MyColors.green;
      default:
        return MyColors.green;
    }
  }
}
