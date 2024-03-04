import 'package:budget/presentation/features/budget/ui/widgets/vertical_space.dart';
import 'package:flutter/material.dart';

import '../../../../utils/styles.dart';

class ColumnText extends StatelessWidget {
  const ColumnText(
      {super.key,
      required this.title,
      required this.subTitle,
      this.align,
      this.crossAxisAlignment});

  final String title;
  final String subTitle;
  final TextAlign? align;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: align ?? TextAlign.start,
          style: Styles.normal,
        ),
        const VerticalSpace(
          space: 2,
        ),
        Text(
          subTitle,
          textAlign: align ?? TextAlign.start,
          style: Styles.normalGray,
        ),
      ],
    );
  }
}
