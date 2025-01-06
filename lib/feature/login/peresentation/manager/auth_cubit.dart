import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopspot/feature/login/data/repos/login_repo.dart';
import '../../data/models/auth_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginRepo loginRepo;
  AuthCubit({required this.loginRepo}) : super(AuthInitial());
  //............................................................................
  Future<void> signInWithEmail({required AuthModel authModel}) async {
    emit(AuthLoading());
    var res = await loginRepo.signInWithEmail(authModel: authModel);
    res.fold(
      (l) {
        emit(AuthFailure(errMessage: l.errMessage));
      },
      (r) {
        emit(AuthSuccess());
      },
    );
  }
  //.......................................................................
  Future<void> signUp({required AuthModel authModel}) async {
    emit(AuthLoading());
    var res = await loginRepo.signUp(authModel: authModel);
    res.fold(
          (l) {
        emit(SignUpFailure(errMessage: l.errMessage));
      },
          (r) {
        emit(SignUpSuccess());
      },
    );
  }
  //............................................................
  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    var res = await loginRepo.signInWithGoogle();
    res.fold(
          (l) {
        emit(SignUpFailure(errMessage: l.errMessage));
      },
          (r) {
        emit(SignUpSuccess());
      },
    );
  }
}
