import 'package:budget/domain/model/remote/category/category_type.dart';
import 'package:budget/presentation/features/budget/ui/widgets/vertical_space.dart';
import 'package:budget/presentation/utils/colors.dart';
import 'package:budget/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

import 'column_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.name,
      required this.total,
      required this.amount,
      required this.type});

  final String name;
  final CategoryType type;
  final int total;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: MyColors.dark,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: MyColors.gray, width: 1)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(_getIcon(type),size: 30,color: Colors.white,),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ColumnText(
                    title: name, subTitle: "\$${total - amount} left to spend"),
              )),
              ColumnText(title: "\$$amount", subTitle: "\$$total")
            ],
          ),
          const VerticalSpace(),
          LinearProgressIndicator(
            backgroundColor: MyColors.grayDark,
            valueColor: AlwaysStoppedAnimation<Color>(_getProgressColor(type)),
            value: _calculateProgress(),
          )
        ],
      ),
    );
  }

  double _calculateProgress() {
    return ((amount * 100) / total) * 0.01;
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
    }
  }
  IconData _getIcon(CategoryType type) {
    switch (type) {
      case CategoryType.transport:
        return Icons.car_crash_outlined;
      case CategoryType.entertainment:
        return Icons.ac_unit;
      case CategoryType.security:
        return Icons.fingerprint;
      case CategoryType.unknown:
        return Icons.warning;
    }
  }
}


