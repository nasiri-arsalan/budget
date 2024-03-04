import 'package:budget/presentation/features/budget/ui/widgets/column_text.dart';
import 'package:budget/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class BudgetChart extends StatelessWidget {
  const BudgetChart(
      {super.key,
      required this.segments,
      required this.budget,
      required this.sumAmount});

  final List<GaugeSegment> segments;
  final int budget;
  final double sumAmount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AnimatedRadialGauge(
          duration: const Duration(seconds: 1),
          curve: Curves.bounceIn,
          radius: 100,
          value: 10,
          axis: GaugeAxis(
            min: 0,
            max: 100,
            degrees: 180,
            style: const GaugeAxisStyle(
              thickness: 10,
              background: MyColors.gray,
              segmentSpacing: 10,
            ),
            pointer: null,
            progressBar: null,
            segments: segments,
          ),

        ),
        ColumnText(
          crossAxisAlignment: CrossAxisAlignment.center,
          title: "\$$sumAmount",
          subTitle: "of \$$budget budget",
        )
      ],
    );
  }
}
/*

*/
