


import 'package:apna_canteen/login/view/screen_login.dart';
import 'package:apna_canteen/login/viewmodel/auth.dart';
import 'package:apna_canteen/utitis/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args) async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
     ChangeNotifierProvider<LogInAuth>(create: ((context) => LogInAuth(FirebaseAuth.instance))),
  ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    MaterialApp(
      theme: ThemeData(
         scaffoldBackgroundColor: kWhiteColor,
            backgroundColor: kWhiteColor,
         textTheme: const TextTheme(
              bodyText1: TextStyle(color: kWhiteColor),
              bodyText2: TextStyle(color: kWhiteColor),
            ),
           appBarTheme: const AppBarTheme(backgroundColor:kBlackColor)
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenSignIn(),
    );
  }
}
