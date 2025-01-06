import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shopspot/core/utilis/constants.dart';
import 'package:shopspot/feature/login/data/models/auth_model.dart';
import 'package:shopspot/feature/login/peresentation/manager/auth_cubit.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/custom_textfield.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/login_caption.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/login_img.dart';
import '../../../../core/functions/get_app_brighness.dart';
import '../../../../core/utilis/app_assets.dart';
import '../../../../core/utilis/app_router.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

AuthModel authModel = AuthModel();
GlobalKey<FormState> formKey = GlobalKey();

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginImg(
              size: size,
              isDarkMode: isLight(context),
              darkImg: AppAssets.registerImg,
              lightImg: AppAssets.registerImg,
            ),
            LoginCaption(
                title: "Login Now",
                caption:
                    "Welcome to ShopSpot\nwhere you can buys everything"),
            const SizedBox(
              height: 35,
            ),
            FadeInRight(
              child: CustomTextField(
                  onSaved: (value) {
                    authModel.email = value!;
                    appEmail = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hintText: "Email",
                  prefixIcon: FontAwesomeIcons.envelope,
                  fillColor: Colors.white,
                  height: size.height * .08,
                  width: size.width * .7),
            ),
            FadeInRight(
              child: CustomTextField(
                  onSaved: (value) {
                    authModel.pass = value!;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: "Password",
                  prefixIcon: FontAwesomeIcons.lock,
                  suffixIcon: FontAwesomeIcons.eye,
                  fillColor: Colors.white,
                  height: size.height * .08,
                  width: size.width * .7),
            ),
            const SizedBox(
              height: 5,
            ),
            FadeInUp(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSignup,extra: BlocProvider.of<AuthCubit>(context));
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Don`t have account? ',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'Register Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: FadeInUp(
                child: Row(
                  children: [
                    Spacer(),
                    CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context)
                              .signInWithEmail(authModel: authModel);
                          GoRouter.of(context).push(AppRouter.kHomeView);
                        }

                      },
                      text: "sign_in",
                      width: size.width * .3,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}
