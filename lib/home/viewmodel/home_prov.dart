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
   TopHomeContainerWid(image: 'https://img.freepik.com/free-vector/pepper-cooking-realistic-composition_1284-71901.jpg?w=1380&t=st=1660225838~exp=1660226438~hmac=3be46bac0a94e6af22ef95bc2e8e8895d5ec71105afa7483cb0a63d0879d1692',),
   TopHomeContainerWid(image: 'https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg?w=900&t=st=1661153097~exp=1661153697~hmac=57bb510e46afa0c6e4ffdc6285612d9628a2c47f0354c049a1c00099b1ff3db9',),
    TopHomeContainerWid(image: 'https://img.freepik.com/premium-photo/full-english-breakfast-with-fried-eggs-sausages-beans-toasts-coffee-copy-space-background-black-wooden-background_187166-53915.jpg?w=900',),
    TopHomeContainerWid(image: 'https://img.freepik.com/premium-photo/kebab-traditional-middle-eastern-arabic-mediterranean-meat-kebab-with-vegetables-herbs-top-view-free-space-your-text_187166-53466.jpg?size=626&ext=jpg',),
  ];
}
