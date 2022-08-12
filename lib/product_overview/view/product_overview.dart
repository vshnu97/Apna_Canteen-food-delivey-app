
import 'package:apna_canteen/product_overview/view/widgets/bottom_bar.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/fonts/font.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';

class ScreenProductOverview extends StatelessWidget {
  const ScreenProductOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
      ),
      bottomNavigationBar: const BottomBarwidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            FoodNameOverviewHead(),
            kheight15,
            CustomedFoodContainerWid(),
            kheight20,
            FoodDetailsWidget(),
          ],
        ),
      ),
    );
  }
}

class BottomBarwidget extends StatelessWidget {
  const BottomBarwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BottomWidget(
          iconColor: kWhiteColor,
          icon: Icons.favorite_outline,
          color: kWhiteColor,
          subtitle: '',
          title: 'Add to wishlist',
          backGroundColor: kBlackColor.withOpacity(1),
        ),
        const BottomWidget(
          iconColor: kBlackColor,
          icon: Icons.room_service,
          color: kBlackColor,
          subtitle: '+',
          title: ' My Meal',
          backGroundColor: Color(0xffffd018),
        )
      ],
    );
  }
}

class FoodDetailsWidget extends StatelessWidget {
  const FoodDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '₹ 70',
              style: primaryFontDSans(
                  fcolor: Colors.black.withOpacity(.7),
                  fsize: 25,
                  fweight: FontWeight.w900),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Color(0xffffd018),
                    size: 28,
                  ),
                  Text(
                    'Add',
                    style: primaryFontDSans(
                        fcolor: const Color(0xffffd018), fsize: 20),
                  )
                ],
              ),
            ),
          ],
        ),
        kheight,
        Text(
          'Get upto 50% off on your first order*',
          style: primaryFontDSansoff(
              fcolor: Colors.red, fsize: 14, fweight: FontWeight.w900),
        ),
        kheight,
        Container(
          width: 90,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              const Icon(
                Icons.percent,
                color: Color(0xffffd018),
                size: 14,
              ),
              Text(
                'Coupons',
                style: primaryFontDSans(
                    fcolor: const Color(0xffffd018), fsize: 12),
              )
            ],
          ),
        ),
        kheight20,
        Text(
          'Description',
          style:
              primaryFontDSans(fsize: 17, fcolor: Colors.black.withOpacity(.7)),
        ),
        kheight5,
         Text(
          'Masala Dosa / dosey / dosai is a variation of the popular South Indian dosa which has its origins in Tuluva Udupi cuisine of Karnataka. It is made from rice, lentils, potato, fenugreek, ghee and curry leaves, and served with chutneys and sambar. It is popular in South India.',
          style: primaryFontDSansoff(fsize: 13, fcolor: Colors.grey),
        )
      ],
    );
  }
}

class CustomedFoodContainerWid extends StatelessWidget {
  const CustomedFoodContainerWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 320,
              width: 250,
              decoration: const BoxDecoration(
                  color: Color(0xff4d434b),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      bottomRight: Radius.circular(60))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Chutney, Sambar,\nFilter Coffee \nincluded',
                    style: primaryFont(fsize: 16, fcolor: kWhiteColor),
                  ),
                  kheight20
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Image.asset(
              'assets/southIndian.png',
              height: 240,
            ),
          ],
        )
      ],
    );
  }
}

class FoodNameOverviewHead extends StatelessWidget {
  const FoodNameOverviewHead({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Masala Dosa',
      style: primaryFont(),
    );
  }
}
