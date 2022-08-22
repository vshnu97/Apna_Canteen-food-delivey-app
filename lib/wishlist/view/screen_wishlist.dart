import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/wishlist/view/widget/fav_widget.dart';
import 'package:apna_canteen/wishlist/viewmodel/fav_prov.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenWishlist extends StatelessWidget {
  const ScreenWishlist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ProductOverPro>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: const Text('Wishlist'),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: prov.favCollection.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              List<ModelClass> list = prov.convertToList(streamSnapshot);
              return list.isNotEmpty
                  ? GridView.count(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 3,
                      childAspectRatio: 1 / 1.40,
                      children: List.generate(
                        list.length,
                        (index) {
                          final id = streamSnapshot.data!.docs[index];
                          final data = list[index];
                          return favWidget(data: data, id: id.id);
                        },
                      ),
                    )
                  :  Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                     
                      Text('No meals in wishlist' ,)
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
