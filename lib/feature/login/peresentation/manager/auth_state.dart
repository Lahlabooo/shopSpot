//part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}
final class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure({required this.errMessage});
}
//.............................
final class SignUpLoading extends AuthState {}
final class SignUpSuccess extends AuthState {}
final class SignUpFailure extends AuthState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
//.................................................
final class GoogleLoading extends AuthState {}
final class GoogleSuccess extends AuthState {}
final class GoogleFailure extends AuthState {
  final String errMessage;
  GoogleFailure({required this.errMessage});
}