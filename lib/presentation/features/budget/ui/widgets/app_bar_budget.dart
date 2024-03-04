import 'package:budget/presentation/utils/colors.dart';
import 'package:budget/presentation/utils/strings.dart';
import 'package:budget/presentation/utils/styles.dart';
import 'package:flutter/material.dart';

class AppBarBudget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.background,
      centerTitle: true,
      title: const Text(
        Strings.spending,
        textAlign: TextAlign.center,
        style: Styles.header,
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            // do something
          },
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
