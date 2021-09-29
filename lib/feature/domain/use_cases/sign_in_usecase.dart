import 'package:mynoteapp/feature/domain/entities/user_entity.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class SignInUseCase {
  FirebaseRepository repository;
  SignInUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signIn(user);
  }
}