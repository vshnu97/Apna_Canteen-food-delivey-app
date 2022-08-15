import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/product_overview/view/widgets/bottom_bar.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/fonts/font.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenProductOverview extends StatelessWidget {
  final ModelClass dataQ;
  const ScreenProductOverview({Key? key, required this.dataQ})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kBlackColor,
      ),
      bottomNavigationBar: const BottomBarwidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            FoodNameOverviewHead(
              dataQ: dataQ,
            ),
            kheight,
            CustomedFoodContainerWid(
              dataQ: dataQ,
            ),
            kheight20,
            FoodDetailsWidget(
              dataQ: dataQ,
            ),
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
  final ModelClass dataQ;
  const FoodDetailsWidget({Key? key, required this.dataQ}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              dataQ.foodPrice,
              style: primaryFontDSans(
                  fcolor: Colors.black.withOpacity(.7),
                  fsize: 25,
                  fweight: FontWeight.w900),
            ),
            const Spacer(),
          ],
        ),
        kheight,
        Text(
          'Get upto 50% off on your first order*',
          style: primaryFontDSansoff(
              fcolor: const Color(0xff6bb044),
              fsize: 14,
              fweight: FontWeight.w900),
        ),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const InfoWidget(
              icon: Icons.star,
              info: '4.08',
              time: 'Ratings',
              iconClr: Color(0xffffd018),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  height: 3,
                  width: 3,
                  color: Colors.grey.withOpacity(.5),
                ),
              ),
            ),
            const InfoWidget(
              icon: FontAwesomeIcons.fire,
              info: 'Recommented',
              time: 'Top Rated',
              iconClr: Colors.red,
            ),
          ],
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

gFontsOleo(
    {Color dcCl = kWhiteColor,
    var td = TextDecoration.none,
    double sz = 16,
    double ls = 0,
    FontWeight fw = FontWeight.bold,
    Color cl = kBlackColor}) {
  return GoogleFonts.mukta(
    decorationColor: dcCl,
    decoration: td,
    fontSize: sz,
    letterSpacing: ls,
    fontWeight: fw,
    color: cl,
  );
}

class InfoWidget extends StatelessWidget {
  const InfoWidget({
    Key? key,
    required this.iconClr,
    required this.icon,
    required this.info,
    required this.time,
  }) : super(key: key);
  final String time;
  final IconData icon;
  final String info;
  final Color iconClr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Icon(
          (icon),
          color: iconClr,
          size: 20,
        ),
        const SizedBox(height: 10),
        Text(
          time,
          style: gFontsOleo(
            cl: kBlackColor.withOpacity(.7),
            sz: 14,
          ),
        ),
        Text(
          info,
          style: gFontsOleo(
            cl: Colors.grey,
            sz: 12,
          ),
        )
      ],
    );
  }
}

class CustomedFoodContainerWid extends StatelessWidget {
  final ModelClass dataQ;
  const CustomedFoodContainerWid({Key? key, required this.dataQ})
      : super(key: key);

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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    kheight5,
                    Text(
                      dataQ.foodSideDish,
                      style: primaryFont(fsize: 15, fcolor: kWhiteColor),
                    ),
                    kheight30
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: Row(
            children: [
              Flexible(
                child: Hero(
                    tag: dataQ.foodImage,
                    child: Image(
                      image: NetworkImage(dataQ.foodImage),
                      height: 210,
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FoodNameOverviewHead extends StatelessWidget {
  final ModelClass dataQ;
  const FoodNameOverviewHead({Key? key, required this.dataQ}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      dataQ.foodName,
      style: primaryFont(),
    );
  }
}
