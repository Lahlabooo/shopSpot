import 'package:dartz/dartz.dart';
import 'package:shopspot/core/app_errors/app_errors.dart';
import 'package:shopspot/core/app_errors/server_error.dart';
import 'package:shopspot/core/utilis/supabase_services.dart';
import 'package:shopspot/feature/login/data/models/auth_model.dart';
import 'package:shopspot/feature/login/data/repos/login_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginRepoImpl extends LoginRepo {
  final SubabaseServices _subabaseServices;

  LoginRepoImpl({required SubabaseServices subabaseServices})
      : _subabaseServices = subabaseServices;
  @override
  Future<Either<AppErrors, AuthResponse>> signInWithEmail(
      {required AuthModel authModel}) async {
    try {
      return Right(await _subabaseServices.signInWithEmail(authModel: authModel));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppErrors, AuthResponse>> signUp({required AuthModel authModel})async {
    try {
      return Right(await _subabaseServices.signUp(authModel: authModel));
    } catch (e) {
    return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<AppErrors, void>> signInWithGoogle() async{
    try {
     return Right(await _subabaseServices.signInWithGoogle());
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
