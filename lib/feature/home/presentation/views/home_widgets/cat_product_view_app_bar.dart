import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utilis/app_style.dart';

class CatProductViewAppBar extends StatelessWidget {
  const CatProductViewAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
          ),
        ),
        SizedBox(
          width: 40,
        ),
        Text(
          title,
          style: AppStyle.textStyle25,
        ),
      ],
    );
  }
}
