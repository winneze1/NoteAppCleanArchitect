import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class GetCurrentUidUseCase {
  FirebaseRepository repository;
  GetCurrentUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUId();
  }
}