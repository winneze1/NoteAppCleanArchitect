import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynoteapp/feature/domain/entities/note_entity.dart';
import 'package:mynoteapp/feature/domain/use_cases/add_new_task_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/delete_note_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/get_notes_usecase.dart';
import 'package:mynoteapp/feature/domain/use_cases/update_note_usecase.dart';
import 'package:mynoteapp/feature/presentation/cubit/note/note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  final UpdateNoteUseCase updateNoteUseCase;
  final DeleteNoteUseCase deleteNoteUseCase;
  final AddNewNoteUseCase addNewNoteUseCase;
  final GetNotesUseCase getNotesUseCase;

  NoteCubit({
    required this.updateNoteUseCase,
    required this.deleteNoteUseCase,
    required this.addNewNoteUseCase,
    required this.getNotesUseCase,
  }) : super(NoteInitial());

  Future<void> addNote({required NoteEntity note}) async {
    try {
      await addNewNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch(_) {
      emit(NoteFailure());
    }
  }

  Future<void> updateNote({required NoteEntity note}) async {
    try {
      await updateNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch(_) {
      emit(NoteFailure());
    }
  }

  Future<void> deleteNote({required NoteEntity note}) async {
    try {
      await deleteNoteUseCase.call(note);
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch(_) {
      emit(NoteFailure());
    }
  }

  Future<void> getNotes({required String uid}) async {
    emit(NoteLoading());
    try {
      getNotesUseCase.call(uid).listen((notes ) {
        emit(NoteLoaded(notes: notes));
      });
    } on SocketException catch (_) {
      emit(NoteFailure());
    } catch(_) {
      emit(NoteFailure());
    }
  }
}
