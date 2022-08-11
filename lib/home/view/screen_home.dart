import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            CircleavatarIconWidget(
              icon: Icons.search_outlined,
            ),
            CircleavatarIconWidget(
              icon: Icons.shop_outlined,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const TopHomeContainerWid(),
              kheight20,
              CategoryRowWid(
                title: 'South Indian',
              ),
              kheight15,
              LimitedBox(
                  maxHeight: 210,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return FoodContainerWidget(
                          image: 'assets/southIndian.png', foodName: 'Dosa', price: '₹ 70',
                        );
                      }))),
              kheight20,
              CategoryRowWid(
                title: 'Chinese',
              ),
              kheight15,
              LimitedBox(
                  maxHeight: 210,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return FoodContainerWidget(
                          image: 'assets/chowmein.png', foodName: 'Chow mein', price: '₹ 180',
                        );
                      }))),
            ],
          ),
        ));
  }
}

class FoodContainerWidget extends StatelessWidget {
  String image;
  String foodName;
  String price;
  FoodContainerWidget({Key? key, required this.image, required this.foodName,required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xffF3F4F8),
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
                        style: const TextStyle(fontSize: 18, color: Colors.grey)),
                    kheight5,
                    Container(
                        height: 29,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: const Color(0xffffd018),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.remove,
                                size: 20,
                              ),
                            ),
                            const Text(
                              '1',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                  color: kBlackColor),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: const Color(0xffffd018),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.add,
                                size: 20,
                              ),
                            ),
                          ],
                        ))
                  ],
                ))
          ],
        ));
  }
}

class CategoryRowWid extends StatelessWidget {
  String title;

  CategoryRowWid({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                fontSize: 20,
                color: kBlackColor)),
        Text('view all',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 1.5,
                fontSize: 20,
                color: Colors.grey.withOpacity(.8)))
      ],
    );
  }
}

class TopHomeContainerWid extends StatelessWidget {
  const TopHomeContainerWid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                  'https://img.freepik.com/free-vector/pepper-cooking-realistic-composition_1284-71901.jpg?w=1380&t=st=1660225838~exp=1660226438~hmac=3be46bac0a94e6af22ef95bc2e8e8895d5ec71105afa7483cb0a63d0879d1692'))),
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 105,
                      ),
                      child: Container(
                        width: 80,
                        height: 60,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                                bottomLeft: Radius.circular(40)),
                            color: Color(0xff1b663e)),
                        child: Column(children: const [
                          SizedBox(
                            height: 2,
                          ),
                          Text('Apna',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  fontSize: 16)),
                          Text('Kitchen',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  fontSize: 16))
                        ]),
                      ),
                    ),
                    kheight,
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text('50% off',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.5,
                              fontSize: 40,
                              shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.9),
                                    offset: const Offset(5, 5),
                                    blurRadius: 10),
                              ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text('On your first order *',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontSize: 13,
                              shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.9),
                                    offset: const Offset(5, 5),
                                    blurRadius: 10),
                              ])),
                    )
                  ]),
            )),
        Expanded(child: Container())
      ]),
    );
  }
}

class CircleavatarIconWidget extends StatelessWidget {
  IconData icon;
  CircleavatarIconWidget({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xff8f6f7d),
        child: Icon(icon),
      ),
    );
  }
}
