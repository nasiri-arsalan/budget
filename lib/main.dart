import 'package:budget/di/service_locator.dart';
import 'package:budget/presentation/features/budget/ui/budget_page.dart';
import 'package:budget/presentation/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spending & Budgets',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.background),
        useMaterial3: true,
      ),
      home: const BudgetPage(),
    );
  }
}

