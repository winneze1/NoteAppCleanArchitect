import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:mynoteapp/feature/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:mynoteapp/feature/data/remote/data_sources/firebase_remote_data_source_impl.dart';
import 'package:mynoteapp/feature/data/repositories/firebase_repository_impl.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';
import 'package:mynoteapp/feature/domain/use_cases/add_new_task_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/delete_note_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/get_current_uid_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/get_notes_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/is_sign_in_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/sign_in_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/sign_out_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/sign_up_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/update_note_usecase.dart';
import 'package:mynoteapp/feature/presentation/cubit/auth/auth_cubit.dart';
import 'package:mynoteapp/feature/presentation/cubit/note/note_cubit.dart';
import 'package:mynoteapp/feature/presentation/cubit/user/user_cubit.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //Cubit/Bloc
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      getCurrentUidUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(
      signInUseCase: sl.call(),
      signUpUseCase: sl.call(),
      getCreateCurrentUserUseCase: sl.call()));
  sl.registerFactory<NoteCubit>(() => NoteCubit(
      updateNoteUseCase: sl.call(),
      deleteNoteUseCase: sl.call(),
      addNewNoteUseCase: sl.call(),
      getNotesUseCase: sl.call()));
  //UserCase
  sl.registerLazySingleton<AddNewNoteUseCase>(
      () => AddNewNoteUseCase(repository: sl.call()));
  sl.registerLazySingleton<DeleteNoteUseCase>(
      () => DeleteNoteUseCase(repository: sl.call()));
  sl.registerLazySingleton<UpdateNoteUseCase>(
      () => UpdateNoteUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetNotesUseCase>(
      () => GetNotesUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));

  //repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(auth: sl.call(), firestore: sl.call()));

  //External
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}
