import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynoteapp/feature/domain/use_cases/get_current_uid_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/is_sign_in_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/sign_out_usecase.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit(
      {required this.getCurrentUidUseCase,
      required this.isSignInUseCase,
      required this.signOutUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase.call();
      if(isSignIn) {
        final uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: uid));
      }else {
        emit(UnAuthenticated());
      }
    } on SocketException catch(_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
     final uid = await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    } on SocketException catch(_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } on SocketException catch(_) {
      emit(UnAuthenticated());
    }
  }
}
