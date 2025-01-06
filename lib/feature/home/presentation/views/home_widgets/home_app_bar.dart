import 'package:flutter/material.dart';
import '../../../../../core/utilis/app_assets.dart';
import '../../../../../core/utilis/constants.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Image.asset(
            AppAssets.homeLogo,
            height: 70,
            width: 60,
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            appTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          IconButton(
            onPressed: () {
            },
            icon: const Icon(
              Icons.local_grocery_store_sharp,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
