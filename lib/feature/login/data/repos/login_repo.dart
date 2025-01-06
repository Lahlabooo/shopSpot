import 'package:dartz/dartz.dart';
import 'package:shopspot/core/app_errors/app_errors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/auth_model.dart';

abstract class LoginRepo{
  Future<Either<AppErrors,AuthResponse>> signInWithEmail({required AuthModel authModel});
  Future<Either<AppErrors,AuthResponse>> signUp({required AuthModel authModel});
  Future<Either<AppErrors,void>> signInWithGoogle();
}