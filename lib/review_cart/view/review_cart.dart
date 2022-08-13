import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/fonts/font.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: kBlackColor,
        ),
        body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(children: [
              Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                            kheight20,
                            Text(
                              'Masala Dosa',
                              style: primaryFontDSans(),
                            ),
                            Container(
                              height: 35,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffe6eaef)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Qty ',
                                    style: primaryFontDSansoff(fsize: 17),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                  )
                                ],
                              ),
                            ),
                            kheight5,
                            Row(
                              children: [
                                Text('₹ 35.00',
                                    style: primaryFontDSansoff(fsize: 22)),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '₹70.00',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                )
                              ],
                            ),
                            Text(
                              'You save ₹35.00',
                              style: primaryFontDSansoff(
                                  fcolor: const Color(0xff6bb044),
                                  fsize: 14,
                                  fweight: FontWeight.w900),
                            ),
                            kheight5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Remove',
                                  style: primaryFontDSansoff(
                                      fsize: 16,
                                      fcolor: const Color.fromARGB(
                                          255, 81, 137, 182)),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
              )
            ])));
  }
}
