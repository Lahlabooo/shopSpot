import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_router.dart';
import '../../../../core/utilis/constants.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {

    super.initState();
     navigateToHome() ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BounceInUp(
          from: 250,duration: Duration(seconds: 2),
                child: Image.asset(AppAssets.appLogo,width: 200,height: 250,)),
            FadeInLeft(
              duration: Duration(seconds: 1),delay: Duration(seconds: 2),
              child: Text(appTitle,style: TextStyle(
                fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
    );
  }
  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 5),
          () {
        GoRouter.of(context).push(AppRouter.kRegister);
      },
    );
  }
}
