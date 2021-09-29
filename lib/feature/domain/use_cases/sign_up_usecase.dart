import 'package:mynoteapp/feature/domain/entities/user_entity.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class SignUpUseCase {
  FirebaseRepository repository;
  SignUpUseCase({required this.repository});

  Future<void> call(UserEntity user) async {
    return repository.signUp(user);
  }
}