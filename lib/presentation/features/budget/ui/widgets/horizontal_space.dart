import 'package:flutter/material.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, this.space});

  final double? space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space ?? 16,
    );
  }
}
