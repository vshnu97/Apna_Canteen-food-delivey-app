import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  void addUserData(
      {required User currentUser,
      String? userName,
      String? userImage,
      String? userEmail}) async {
    await FirebaseFirestore.instance
        .collection('userData')
        .doc(currentUser.uid)
        .set({
      'userName': userName,
      'userImage': userImage,
      'userEmail': userEmail,
      'userUid': currentUser.uid
    });
  }
}
