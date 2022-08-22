import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/product_overview/view/product_overview.dart';
import 'package:apna_canteen/product_overview/view/widgets/fav_button.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';

class SouthIndianFoodWidget extends StatelessWidget {
  final ModelClass dataQ;
  final String id;
  const SouthIndianFoodWidget({Key? key, required this.dataQ, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        height: 200,
        width: 155,
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
                  WishlistFavWidget(
                    dataQ: dataQ,
                    id: id,
                  )
                ],
              ),
            ),
            Expanded(
                flex: 4,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ScreenProductOverview(dataQ: dataQ, id: id)));
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: FittedBox(
                        child: Text(dataQ.foodName,
                            maxLines: 2,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 18,
                                color: kBlackColor)),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        '₹ ${dataQ.foodPrice}.00',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ))
          ],
        ));
  }
}
