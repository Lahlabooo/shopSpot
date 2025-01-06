

import 'package:dartz/dartz.dart';

import '../app_errors/app_errors.dart';

abstract class UseCase<Type> {
  Future<Either<AppErrors,Type>>call ();
}