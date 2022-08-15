import 'package:cloud_firestore/cloud_firestore.dart';

class ModelClass {
  String foodName;
  num foodPrice;
  String foodImage;
  String foodSideDish;
  num foodRating;
  num foodOfferPrice;

  ModelClass(
      {required this.foodImage,
      required this.foodName,
      required this.foodPrice,
      required this.foodSideDish,
      required this.foodRating,
      required this.foodOfferPrice});

  Map<String, dynamic> toSnapshot() {
    return {
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodImage': foodImage,
      'foodSideDish': foodSideDish,
      'foodRating': foodRating,
      'foodOfferPrice': foodOfferPrice
    };
  }

  factory ModelClass.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return ModelClass(
      foodImage: snapshot['foodImage'],
      foodName: snapshot['foodName'],
      foodPrice: snapshot['foodPrice'],
      foodSideDish: snapshot['foodSideDish'],
      foodRating: snapshot['foodRating'],
      foodOfferPrice: snapshot['foodOfferPrice'],
    );
  }
}
