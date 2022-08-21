import 'package:flutter/cupertino.dart';

class OverviewProv extends ChangeNotifier{

  dicountFuntion(num foodPrice, num foodOfferPrice){

    double finalPrice = (foodOfferPrice/foodPrice)*100;
    double price = 100 - finalPrice;
    return price.toStringAsFixed(2);

  }

 //fav button
  bool favButton = false;

  favButtonChange({required bool favButton}) {
    this.favButton = favButton;
    notifyListeners();
  }
}