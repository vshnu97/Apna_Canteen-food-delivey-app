import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/home/view/screen_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeProv extends ChangeNotifier {
  final southIndianCollection =
      FirebaseFirestore.instance.collection('south');

  List<ModelClass> convertToList(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      List<ModelClass> listNew = snapshot.data!.docs.map((convert) {
        return ModelClass.fromSnapshot(convert.data() as Map<String, dynamic>);
      }).toList();

      listNew = listNew.reversed.toList();
      return listNew;
    } else {
      return [];
    }
  }

  int carouselIndex = 0;
  carouselSlider(index) {
    carouselIndex = index;
    notifyListeners();
  }

  List cardList = [
    const TopHomeContainerWid(),
    const TopHomeContainerWid(),
    const TopHomeContainerWid(),
    const TopHomeContainerWid(),
  ];
}
