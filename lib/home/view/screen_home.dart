import 'package:apna_canteen/home/view/widgets/chinese.dart';
import 'package:apna_canteen/home/view/widgets/south_indian.dart';
import 'package:apna_canteen/home/viewmodel/home_prov.dart';
import 'package:apna_canteen/review_cart/view/review_cart.dart';
import 'package:apna_canteen/search/view/screen_search.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          elevation: 0,
          foregroundColor: kBlackColor,
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenSearch()));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: kBlackColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ReviewCart()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                size: 30,
                color: kBlackColor,
              ),
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
                  child: Consumer<HomeProv>(builder: (context, value, child) {
                    return value.southIndianList.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: value.southIndianList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) {
                              final dataQ = value.southIndianList[index];
                              return SouthIndianFoodWidget(
                                dataQ: dataQ,
                              );
                            }))
                        : const CupertinoActivityIndicator(
                            radius: 50,
                          );
                  })),
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
                        return ChineseFoodWidget(
                          image: 'assets/chowmein.png',
                          foodName: 'Chow mein',
                          price: '₹ 180.00',
                        );
                      }))),
            ],
          ),
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
                                topLeft: Radius.circular(10),
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
