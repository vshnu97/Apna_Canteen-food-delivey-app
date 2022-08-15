import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/fonts/font.dart';
import 'package:flutter/material.dart';

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