import 'package:apna_canteen/home/viewmodel/add_button_prov.dart';
import 'package:apna_canteen/home/viewmodel/home_prov.dart';
import 'package:apna_canteen/login/view/screen_login.dart';
import 'package:apna_canteen/login/viewmodel/auth.dart';
import 'package:apna_canteen/login/viewmodel/user_prov.dart';
import 'package:apna_canteen/wishlist/viewmodel/fav_prov.dart';
import 'package:apna_canteen/product_overview/viewmodel/overview.dart';
import 'package:apna_canteen/review_cart/viewmodel/review_prov.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
 
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<LogInAuth>(
        create: ((context) => LogInAuth(FirebaseAuth.instance))),
    ChangeNotifierProvider<HomeProv>(create: ((context) => HomeProv())),
    ChangeNotifierProvider<ReviewCartProv>(
        create: ((context) => ReviewCartProv())),
    ChangeNotifierProvider<OverviewProv>(create: ((context) => OverviewProv())),
    ChangeNotifierProvider<UserProvider>(create: ((context) => UserProvider())),
    ChangeNotifierProvider<ProductOverPro>(create: ((context) => ProductOverPro())),
    ChangeNotifierProvider<AddButtonProv>(
        create: ((context) => AddButtonProv())),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xffe6eaef),
          backgroundColor: const Color(0xffe6eaef),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: kWhiteColor),
            bodyText2: TextStyle(color: kWhiteColor),
          ),
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xffe6eaef))),
      debugShowCheckedModeBanner: false,
      home:  const ScreenSignIn(),
    );
  }
}
