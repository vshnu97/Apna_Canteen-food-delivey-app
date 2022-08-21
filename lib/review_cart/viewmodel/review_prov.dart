import 'package:apna_canteen/home/model/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ReviewCartProv extends ChangeNotifier {
  void reviewCartData({required ModelClass model}) async {
    final obl = FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('YourReviewCart');
    obl.doc(obl.id).set(model.toSnapshot());
  }

  int count = 1;
  bool isTrue = false;

  changeValue() {
    isTrue = true;
    notifyListeners();
  }

  changeValueRemmove() {
    isTrue = false;
    notifyListeners();
  }

  counterPlus() {
    count++;
    notifyListeners();
  }

  counterRem() {
    count--;
    notifyListeners();
  }
}
