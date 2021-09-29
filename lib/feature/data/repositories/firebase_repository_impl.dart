import 'package:mynoteapp/feature/data/remote/data_sources/firebase_remote_data_source.dart';
import 'package:mynoteapp/feature/domain/entities/note_entity.dart';
import 'package:mynoteapp/feature/domain/entities/user_entity.dart';
import 'package:mynoteapp/feature/domain/repositories/firebase_reqpository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});
  @override
  Future<void> addNewNote(NoteEntity note) async {
    return remoteDataSource.addNewNote(note);
  }

  @override
  Future<void> deleteNote(NoteEntity note) async {
    return remoteDataSource.deleteNote(note);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    return remoteDataSource.getCreateCurrentUser(user);
  }

  @override
  Future<String> getCurrentUId() async {
    return remoteDataSource.getCurrentUId();
  }

  @override
  Stream<List<NoteEntity>> getNotes(String id) {
    return remoteDataSource.getNotes(id);
  }

  @override
  Future<bool> isSignIn() async {
    return remoteDataSource.isSignIn();
  }

  @override
  Future<void> signIn(UserEntity user) async {
    return remoteDataSource.signIn(user);
  }

  @override
  Future<void> signOut() async {
    return remoteDataSource.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    return remoteDataSource.signUp(user);
  }

  @override
  Future<void> updateNote(NoteEntity note) async {
    return remoteDataSource.updateNote(note);
  }

}