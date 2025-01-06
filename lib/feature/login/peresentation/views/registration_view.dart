import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopspot/feature/login/peresentation/manager/auth_cubit.dart';
import '../../../../core/utilis/setup_service_locator.dart';
import '../../data/repos/login_repo.dart';
import 'registration_body.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocProvider(
        create: (context) => AuthCubit(loginRepo: getIt.get<LoginRepo>(),),
        child: RegistrationBody(),
      )),
    );
  }
}
