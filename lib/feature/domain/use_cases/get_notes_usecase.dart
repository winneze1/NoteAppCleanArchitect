import 'package:mynoteapp/feature/domain/entities/note_entity.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class GetNotesUseCase {
  FirebaseRepository repository;
  GetNotesUseCase({required this.repository});

  Stream<List<NoteEntity>> call(String uid) {
    return repository.getNotes(uid);
  }
}