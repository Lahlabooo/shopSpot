part of 'firebase_cubit.dart';

sealed class FirebaseState {}

final class FirebaseInitial extends FirebaseState {}
//..........................................................
final class SuccessInsert extends FirebaseState {}
final class FailureInsert extends FirebaseState {}
//............................................................
final class SuccessGetData extends FirebaseState {}
final class FailureGetData extends FirebaseState {}
//.............................................................
final class SuccessDeleted extends FirebaseState {}
final class FailureDeleted extends FirebaseState {}

