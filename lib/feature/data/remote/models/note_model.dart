import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynoteapp/feature/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  NoteModel({
    final String? noteId,
    final String? note,
    final Timestamp? time,
    final String? uid,
  }) : super (
    uid: uid,
    note: note,
    time: time,
    noteId: noteId
  );

  factory NoteModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return NoteModel(
      uid: documentSnapshot.get('uid'),
      note: documentSnapshot.get('note'),
      time: documentSnapshot.get('time'),
      noteId: documentSnapshot.get('noteId'),
    );
  }

  Map<String, dynamic> toDocument(){
    return {
      "uid": uid,
      "note": note,
      "time": time,
      "noteId": noteId
    };
  }

}