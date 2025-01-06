import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shopspot/core/functions/get_app_brighness.dart';
import 'package:shopspot/core/utilis/supabase_services.dart';
import 'package:shopspot/feature/login/peresentation/manager/auth_cubit.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/login_button.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/login_caption.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/login_img.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_router.dart';
import '../../../../core/widgets/custom_button.dart';

class RegistrationBody extends StatelessWidget {
  const RegistrationBody({super.key});
  @override
  Widget build(BuildContext context) {
    SubabaseServices subabaseServices = SubabaseServices();
    final Size size = MediaQuery.sizeOf(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoginImg(
            size: size,
            isDarkMode: isLight(context),
            darkImg: AppAssets.registerImg,
            lightImg: AppAssets.registerImg,
          ),
          LoginCaption(
            title: 'Hello',
            caption: "Welcome to ShopSpot\nwhere you can buys everything",
          ),
          const SizedBox(
            height: 35,
          ),
          FadeInRight(
            duration: Duration(seconds: 2),
            child: CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kLogin,
                    extra: BlocProvider.of<AuthCubit>(context));
              },
              text: 'Login',
              width: size.width * .6,
              height: 50,
              color: Colors.blueAccent,
              border: true,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          FadeInRight(
            duration: Duration(seconds: 2),
            child: CustomButton(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignup,
                    extra: BlocProvider.of<AuthCubit>(context));
              },
              text: 'SignUp',
              width: size.width * .6,
              height: 50,
              color: Colors.transparent,
              textStyle:
                  TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              border: true,
              borderColor: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          FadeInRight(
            duration: Duration(seconds: 2),
            child: SignInButton(
              text: "Sign Up with Google",
              icon: FontAwesomeIcons.google, // Replace with custom icon
              color: Colors.white,
              textColor: Colors.black,
              iconColor: Colors.red,
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).signInWithGoogle();
              },
              height: size.height * .05,
              width: size.width * .6,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FadeInRight(
            duration: Duration(seconds: 2),
            child: SignInButton(
              iconColor: Colors.blue,
              text: "Sign Up with Facebook",
              icon: FontAwesomeIcons.facebook,
              color: Colors.white,
              textColor: Colors.black,
              onPressed: () {
                subabaseServices.signInWithFacebook();
              },
              height: size.height * .05,
              width: size.width * .6,
            ),
          ),
        ],
      ),
    );
  }
}
