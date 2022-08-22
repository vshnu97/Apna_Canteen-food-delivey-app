import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/product_overview/viewmodel/fav_prov.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishlistFavWidget extends StatelessWidget {
  const WishlistFavWidget({
    Key? key,
    required this.dataQ,
    required this.id,
  }) : super(key: key);

  final ModelClass dataQ;
  final String id;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('userData')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .collection('wishList')
          .where('foodName', isEqualTo: dataQ.foodName)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return snapshot.hasData
            ? snapshot.data!.docs.isNotEmpty
                ? IconButton(
                  splashRadius: 26,
                    onPressed: () {
                      ProductOverPro.deleteFav(dataQ.foodName);
                    },
                    icon: const Icon(Icons.favorite, color: Colors.red),
                  )
                : IconButton(
                    onPressed: () {
                      ProductOverPro.addWishList(
                          data: dataQ, id: id, fav: true);
                    },
                    icon: const Icon(Icons.favorite_outline),
                  )
            : const SizedBox();
      },
    );
  }
}
