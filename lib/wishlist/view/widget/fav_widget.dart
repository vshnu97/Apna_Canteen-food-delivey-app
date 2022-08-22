import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/wishlist/viewmodel/fav_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class favWidget extends StatelessWidget {
  final ModelClass data;
  final String id;
  const favWidget({Key? key, required this.data, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = context.read<ProductOverPro>();
    return Column(
      children: [
        Container(
          height: 210,
          width: 190,
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
           // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network(data.foodImage,height: 110,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FittedBox(
                  child: Text(data.foodName,
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 18,
                          color: kBlackColor)),
                ),
              ),
              // WishlistFavWidget(dataQ: dataQ, id: id,),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  '₹ ${data.foodPrice}.00',
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () {
                    prov.deleteFav(data.foodName);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kGreyColor.withOpacity(.2),
                          ),
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          color: kBlackColor,
                          size: 20,
                        ),
                      ),
                      const Text(
                        'Remove',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 81, 137, 182),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
