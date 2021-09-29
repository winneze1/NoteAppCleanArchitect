import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class SignOutUseCase {
  FirebaseRepository repository;
  SignOutUseCase({required this.repository});

  Future<void> call() async {
    return repository.signOut();
  }
}