import 'package:mynoteapp/feature/domain/entities/note_entity.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class DeleteNoteUseCase {
  final FirebaseRepository repository;
  DeleteNoteUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.deleteNote(note);
  }
}