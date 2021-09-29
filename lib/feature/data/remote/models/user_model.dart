import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynoteapp/feature/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({final String? name,
   final String? email,
   final String? uid,
   final String? status,
    final String? password,}) : super(
    uid: uid,
    name: name,
    email: email,
    status: status,
    password: password
  );

  factory UserModel.fromSnapShot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      status: documentSnapshot.get('status'),
      name: documentSnapshot.get('name'),
      uid: documentSnapshot.get('uid'),
      email: documentSnapshot.get('email'),
    );
  }

  Map<String, dynamic> toDocument(){
    return {
      "status": status,
      "uid": uid,
      "email": email,
      "name": name
    };
  }

}