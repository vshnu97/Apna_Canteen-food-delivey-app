import 'package:cloud_firestore/cloud_firestore.dart';

class ModelClass {
  String foodName;
  int foodPrice;
  String foodImage;

  ModelClass(
      {required this.foodImage,
      required this.foodName,
      required this.foodPrice});

  Map<String, dynamic> toSnapshot() {
    return {
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodImage': foodImage
    };
  }

 factory ModelClass.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
  return ModelClass(
    foodImage: snapshot['foodImage'], 
    foodName: snapshot['foodName'], 
    foodPrice: snapshot['foodPrice'],
    );
 }
}
