

import 'package:dartz/dartz.dart';

import '../app_errors/app_errors.dart';

abstract class UseCaseWithParams<Type , Param> {
  Future<Either<AppErrors,Type>>call (Param param);
}