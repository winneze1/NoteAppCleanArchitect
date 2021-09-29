import 'package:equatable/equatable.dart';
import 'package:mynoteapp/feature/domain/entities/note_entity.dart';

abstract class NoteState extends Equatable {
  const NoteState();
}

class NoteInitial extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteLoading extends NoteState {
  @override
  List<Object?> get props => [];
}

class NoteLoaded extends NoteState {
  final List<NoteEntity> notes;

  NoteLoaded({required this.notes});
  @override
  List<Object?> get props => [notes];
}

class NoteFailure extends NoteState {
  @override
  List<Object?> get props => [];
}