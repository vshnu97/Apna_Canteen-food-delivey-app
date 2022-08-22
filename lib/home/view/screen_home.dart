import 'package:apna_canteen/home/model/class.dart';
import 'package:apna_canteen/home/view/widgets/chinese.dart';
import 'package:apna_canteen/home/view/widgets/south_indian.dart';
import 'package:apna_canteen/home/viewmodel/home_prov.dart';
import 'package:apna_canteen/review_cart/view/review_cart.dart';
import 'package:apna_canteen/routes/routes.dart';
import 'package:apna_canteen/search/view/screen_search.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeProv>(context);
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
              Consumer<HomeProv>(
                builder: (context, value, child) => Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 180.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 2700),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          value.carouselSlider(index);
                        },
                      ),
                      items: value.cardList.map((card) {
                        return Builder(builder: (BuildContext context) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.30,
                            width: MediaQuery.of(context).size.width,
                            child: card,
                          );
                        });
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: value.cardList.map((url) {
                        int index = value.cardList.indexOf(url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: value.carouselIndex == index
                                ? Colors.red
                                : const Color.fromARGB(102, 146, 180, 221),
                          ),
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
              kheight20,
              const CategoryRowWid(
                title: 'South Indian',
                screen: ScreenSearch(),
              ),
              kheight15,
              LimitedBox(
                  maxHeight: 210,
                  child: StreamBuilder(
                      stream: prov.southIndianCollection.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        List<ModelClass> list =
                            prov.convertToList(streamSnapshot);
                        return streamSnapshot.hasData
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: list.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  final dataQ = list[index];
                                  final id = streamSnapshot.data!.docs[index];
                                  return SouthIndianFoodWidget(
                                      dataQ: dataQ, id: id.id);
                                }))
                            : const CupertinoActivityIndicator(
                                radius: 40,
                              );
                      })),
              kheight20,
              const CategoryRowWid(
                title: 'Chinese',
                screen: ScreenSearch(),
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
  final String title;
  final Widget screen;

  const CategoryRowWid({Key? key, required this.title, required this.screen})
      : super(key: key);

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
        InkWell(
          onTap: () {
            RoutesScreen().pushScreen(context, screen);
          },
          child: Text('view all',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                  fontSize: 20,
                  color: Colors.grey.withOpacity(.8))),
        )
      ],
    );
  }
}

class TopHomeContainerWid extends StatelessWidget {
  String image;
  TopHomeContainerWid({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              fit: BoxFit.fitWidth, image: NetworkImage(image))),
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
