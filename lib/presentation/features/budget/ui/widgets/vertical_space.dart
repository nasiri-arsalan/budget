import 'package:flutter/material.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, this.space});

  final double? space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space ?? 16,
    );
  }
}
