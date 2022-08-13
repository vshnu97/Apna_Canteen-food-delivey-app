import 'package:apna_canteen/home/model/class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class HomeProv extends ChangeNotifier{

  HomeProv(){
    getData();
   
  }
   List<ModelClass> southIndianList = [];
  
  //  final object  = FirebaseFirestore.instance.collection('SouthIndian');

  getData()async{

     QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection('south').get();
    final list =  snapshot.docs.map((docSnapshot) => ModelClass.fromSnapshot(docSnapshot)).toList();
    southIndianList.addAll(list);
    notifyListeners();
  }
}