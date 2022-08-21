import 'package:apna_canteen/login/viewmodel/auth.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:apna_canteen/utitis/fonts/font.dart';
import 'package:apna_canteen/utitis/sizedbox/szbox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({Key? key}) : super(key: key);
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    Size sizez = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
         FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/main.png',
                height: 400,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      ' #1 Food Delivery\nand Cloud Kitchen',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        color: kBlackColor,
                      ),
                    ),
                    Row(
                      children: [
                        DividerWidget(size: size),
                        Text(
                          "Sign up or Log in",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: kGreyColor.withOpacity(.6)),
                        ),
                        DividerWidget(size: size),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: sizez.width / 6.5,
                          height: sizez.width / 7,
                          decoration: BoxDecoration(
                              color: kBlackColor.withOpacity(.08),
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            'assets/fl.png',
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: sizez.width / 7,
                          width: sizez.width / 1.32,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: sizez.width / 30),
                          decoration: BoxDecoration(
                              color: kBlackColor.withOpacity(.08),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            autofocus: true,
                            onFieldSubmitted: (v) {
                              FocusScope.of(context).requestFocus(focus);
                            },
                            textInputAction: TextInputAction.next,
                            maxLength: 10,
                            // controller: contoller,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                color: kBlackColor.withOpacity(.8),
                                letterSpacing: .8),
                            decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.phone_android,
                                  color: kBlackColor.withOpacity(.7)),
                              hintText: 'Phone Number',
                              hintStyle: TextStyle(
                                  color: kBlackColor.withOpacity(.5),
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                        color: const Color(0xff99d5d7),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Continue',
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: (size / 2.2),
                          child: const Divider(),
                        ),
                        Text(
                          "Or",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              color: kGreyColor.withOpacity(.6)),
                        ),
                        SizedBox(
                          width: (size / 2.5),
                          child: const Divider(),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          radius: 10,
                          onTap: () {
                            context.read<LogInAuth>().googleLogIn(context);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Image.asset(
                              'assets/google.png',
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(10.0),
                                  ),
                                ),
                                backgroundColor: kWhiteColor, // <-- SEE HERE
                                builder: (context) {
                                  return SizedBox(
                                    height: 160,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 25),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              BottomSheetContainerWid(
                                                image: 'assets/fb.png',
                                                title: 'Continue with Facebook',
                                              ),
                                              kheight,
                                              BottomSheetContainerWid(
                                                image: 'assets/gm.png',
                                                title: 'Continue with Email',
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Image.asset(
                              'assets/more.png',
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'By continuing, you agreed to our',
                          style: gFontsLoginbottom(),
                        ),
                        Text(
                          'Terms and Privacy Policy',
                          style: gFontsLoginbottom(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class BottomSheetContainerWid extends StatelessWidget {
  final String image;
  final String title;
  const BottomSheetContainerWid(
      {Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: kGreyColor.withOpacity(.3))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: gFontsOleo(),
            )
          ],
        ));
  }
}

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    required double size,
  })  : _size = size,
        super(key: key);

  final double _size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (_size / 3.1),
      child: const Divider(),
    );
  }
}
