import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/fonts/font.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CupertinoSearchTextField(
                // controller:
                backgroundColor: kBlackColor.withOpacity(.2),
                style: const TextStyle(color: kBlackColor),
                onChanged: (value) {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: kBlackColor,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: kBlackColor,
                ),
              ),
            ),
            Expanded(child: ListView.builder(itemBuilder: (((context, index) {
              return const SearchItemWidget();
            }))))
          ],
        ),
      ),
    );
  }
}

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            child: CircleAvatar(
              backgroundColor: kWhiteColor,
              radius: 60,
              backgroundImage: AssetImage('assets/chowmein.png'),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masala Dosa',
                  style: primaryFontDSans(),
                ),
                kheight5,
                Text('₹ 35.00', style: primaryFontDSansoff(fsize: 22)),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
