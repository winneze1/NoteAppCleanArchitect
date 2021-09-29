import 'package:mynoteapp/feature/domain/entities/note_entity.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class AddNewNoteUseCase {
  final FirebaseRepository repository;
  AddNewNoteUseCase({required this.repository});

  Future<void> call(NoteEntity note) async {
    return repository.addNewNote(note);
  }
}