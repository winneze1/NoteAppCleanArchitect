import 'package:mynoteapp/feature/domain/entities/note_entity.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class UpdateNoteUseCase {
  FirebaseRepository repository;
  UpdateNoteUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.updateNote(note);
  }
}