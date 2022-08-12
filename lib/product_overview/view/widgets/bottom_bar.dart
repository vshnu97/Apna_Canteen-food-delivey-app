import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final Color color;
  final Color backGroundColor;
  final String title;
  final String subtitle;
  const BottomWidget({
    Key? key,
    required this.iconColor,
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.backGroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 60,
        color: backGroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 22,
            ),
            const SizedBox(width: 10),
            Row(
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                      color: color,
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1),
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: color,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
