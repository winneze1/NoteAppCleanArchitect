import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class IsSignInUseCase {
  final FirebaseRepository repository;
  IsSignInUseCase({required this.repository});

  Future<bool> call() async {
    return repository.isSignIn();
  }
}