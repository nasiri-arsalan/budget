import 'package:budget/presentation/utils/colors.dart';
import 'package:budget/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class BudgetTruck extends StatelessWidget {
  const BudgetTruck({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(color: MyColors.gray, width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        text,
        style: Styles.normal,
      ),
    );
  }
}
