import 'package:apna_canteen/home/viewmodel/add_button_prov.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton( {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddButtonProv>(
      builder: (context, value, child) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          height: 28,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: value.isTrue == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (value.count > 1) {
                            value.counterRem();
                          }
                          if (value.count == 1) {
                            value.changeValueRemmove();
                          }
                        },
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                          color: Color(0xffffd018),
                        ),
                      ),
                    ),
                    Text(
                      '${value.count}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        value.counterPlus();
                      },
                      child: const Icon(
                        Icons.add,
                        color: Color(0xffffd018),
                        size: 20,
                      ),
                    ),
                  ],
                )
              : Center(
                  child: InkWell(
                    onTap: () {
                      value.changeValue();
                    },
                    child: const Text(
                      'ADD',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ),
                )),
    );
  }
}
