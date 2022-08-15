import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/product_overview/view/product_overview.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';

class SouthIndianFoodWidget extends StatelessWidget {
  final ModelClass dataQ;
  const SouthIndianFoodWidget(
      {Key? key, required this.dataQ, required int index})
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
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 25,
                        color: Colors.red,
                      ))
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScreenProductOverview(
                                dataQ: dataQ,
                              )));
                    },
                    child: Hero(
                        tag: dataQ.foodImage,
                        child: Image.network(
                          dataQ.foodImage,
                        )))),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    kheight20,
                    FittedBox(
                      child: Text(dataQ.foodName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 18,
                              color: kBlackColor)),
                    ),
                    kheight5,
                    Text("₹ ${dataQ.foodPrice}",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold)),
                  ],
                ))
          ],
        ));
  }
}
