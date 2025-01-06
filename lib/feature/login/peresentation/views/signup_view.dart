import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopspot/feature/login/peresentation/manager/auth_cubit.dart';
import 'package:shopspot/feature/login/peresentation/views/signup_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key, required this.cubitValue});
final AuthCubit cubitValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocProvider.value(value: cubitValue, child: SafeArea(child: SignupBody())),
    );
  }
}
