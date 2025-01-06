import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:shopspot/core/functions/get_app_brighness.dart';
import 'package:shopspot/feature/login/data/models/auth_model.dart';
import 'package:shopspot/feature/login/peresentation/manager/auth_cubit.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/custom_textfield.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/login_caption.dart';
import 'package:shopspot/feature/login/peresentation/views/widgets/login_img.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/utilis/app_assets.dart';
import '../../../../core/widgets/custom_button.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});
  @override
  State<SignupBody> createState() => _SignupBodyState();
}
 AuthModel authModel = AuthModel();
GlobalKey<FormState> formKey = GlobalKey();
SupabaseClient subabaseClient = Supabase.instance.client;
class _SignupBodyState extends State<SignupBody> {
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
                title: "SignUp Now",
                caption: "Welcome to ShopSpot\nwhere you can buys everything"),
            const SizedBox(height: 25,),
            FadeInRight(
              child: CustomTextField(
                  onSaved: (value) {
                    authModel.userName = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  hintText: "userName",
                  prefixIcon: FontAwesomeIcons.user,
                  fillColor: Colors.white,
                  height: size.height * .08,
                  width: size.width * .7
              ),
            ),
            FadeInRight(
              child: CustomTextField(
                  onSaved: (value) {
                    authModel.email = value!;
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
                    authModel.pass= value!;
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
            const SizedBox(height: 70,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: FadeInUp(
                child: Row(
                  children: [
                    Spacer(),
                    CustomButton(
                      onTap: () {
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          BlocProvider.of<AuthCubit>(context).signUp(authModel: authModel);
                          GoRouter.of(context).pop();
                        }
                      },
                      text: "sign_up",
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
