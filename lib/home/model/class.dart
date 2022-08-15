import 'package:cloud_firestore/cloud_firestore.dart';

class ModelClass {
  String foodName;
  String foodPrice;
  String foodImage;
  String foodSideDish;

  ModelClass(
      {required this.foodImage,
      required this.foodName,
      required this.foodPrice,
      required this.foodSideDish
      
      });

  Map<String, dynamic> toSnapshot() {
    return {
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodImage': foodImage,
      'foodSideDish':foodSideDish
    };
  }

 factory ModelClass.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot){
  return ModelClass(
    foodImage: snapshot['foodImage'], 
    foodName: snapshot['foodName'], 
    foodPrice: snapshot['foodPrice'],
     foodSideDish: snapshot['foodSideDish'],
    );
 }
}
