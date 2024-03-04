import 'package:budget/presentation/features/budget/ui/widgets/horizontal_space.dart';
import 'package:budget/presentation/utils/colors.dart';
import 'package:budget/presentation/utils/strings.dart';
import 'package:budget/presentation/utils/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class NewCategory extends StatelessWidget {
  const NewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: DottedBorder(
        color: MyColors.gray,
        borderType: BorderType.RRect,
        dashPattern: const [3,3],
        strokeWidth: 2,
        radius: const Radius.circular(15),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.addNewCategory,
                style: Styles.large,
              ),
              HorizontalSpace(),
              Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
