import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynoteapp/feature/domain/entities/user_entity.dart';
import 'package:mynoteapp/feature/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/sign_in_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/sign_up_usecase.dart';
import 'package:mynoteapp/feature/presentation/cubit/user/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;

  UserCubit(
      {required this.signInUseCase,
      required this.signUpUseCase,
      required this.getCreateCurrentUserUseCase})
      : super(UserInitial());

  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signInUseCase.call(user);
      emit(UserSuccess());
    }
    on SocketException catch (_) {
      emit(UserFailure());
    }
    catch (e) {
      emit(UserFailure());
    }
  }

  Future<void> submitSignUp({required UserEntity user}) async {
    emit(UserLoading());
    try {
      await signUpUseCase.call(user);
      await getCreateCurrentUserUseCase.call(user);
      emit(UserSuccess());
    }
    on SocketException catch (_) {
      emit(UserFailure());
    }
    catch (e) {
      emit(UserFailure());
    }
  }


}
