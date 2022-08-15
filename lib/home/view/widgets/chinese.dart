import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';

import '../../../utitis/colors/colors.dart';

class ChineseFoodWidget extends StatelessWidget {
  String image;
  String foodName;
  String price;
  ChineseFoodWidget(
      {Key? key,
      required this.image,
      required this.foodName,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        height: 200,
        width: 140,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kheight5,
            Expanded(
                flex: 4,
                child: Image.asset(
                  image,
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text(foodName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 18,
                            color: kBlackColor)),
                    kheight5,
                    Text(price,
                        // '₹ 130',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.grey)),
                    kheight5,
                     //AddButton(southIndianList: null,)
                  ],
                ))
          ],
        ));
  }
}
