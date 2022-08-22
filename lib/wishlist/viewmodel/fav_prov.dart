import 'package:apna_canteen/home/model/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProductOverPro extends ChangeNotifier {
  static addWishList(
      {required ModelClass data, required String id, required bool fav}) {
    final favData = ModelClass(
        foodImage: data.foodImage,
        foodName: data.foodName,
        foodPrice: data.foodPrice,
        foodSideDish: data.foodSideDish,
        foodRating: data.foodRating,
        foodFav: fav,
        foodOfferPrice: data.foodOfferPrice);

    FirebaseFirestore.instance
        .collection('userData')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('wishList')
        .doc(data.foodName)
        .set(favData.toSnapshot());
  }

   deleteFav(String name) {
    FirebaseFirestore.instance
        .collection('userData')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .collection('wishList')
        .doc(name)
        .delete();
  }

  final favCollection = FirebaseFirestore.instance
      .collection('userData')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('wishList');

       List<ModelClass> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<ModelClass> newlist = snapshot.data!.docs.map((convert) {
        return ModelClass.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      newlist = newlist.reversed.toList();
      return newlist;
    } else {
      return [];
    }
  }
}
