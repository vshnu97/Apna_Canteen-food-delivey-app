
class ModelClass {
  String foodName;
  num foodPrice;
  String foodImage;
  String foodSideDish;
  num foodRating;
  num foodOfferPrice;
  bool foodFav;

  ModelClass(
      {required this.foodImage,
      required this.foodName,
      required this.foodPrice,
      required this.foodSideDish,
      required this.foodRating,
      required this.foodFav,
      required this.foodOfferPrice});

  Map<String, dynamic> toSnapshot() {
    return {
      'foodName': foodName,
      'foodPrice': foodPrice,
      'foodImage': foodImage,
      'foodSideDish': foodSideDish,
      'foodRating': foodRating,
      'foodOfferPrice': foodOfferPrice,
      'foodFav': foodFav
    };
  }

  factory ModelClass.fromSnapshot(Map<String, dynamic> snapshot) {
    return ModelClass(
        foodImage: snapshot['foodImage'],
        foodName: snapshot['foodName'],
        foodPrice: snapshot['foodPrice'],
        foodSideDish: snapshot['foodSideDish'],
        foodRating: snapshot['foodRating'],
        foodOfferPrice: snapshot['foodOfferPrice'],
        foodFav: snapshot['foodFav']);
  }
}
