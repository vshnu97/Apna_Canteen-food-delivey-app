import 'package:apna_canteen/login/viewmodel/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/LoginBg.png'), fit: BoxFit.fitHeight)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Sign in to continue',
                ),
                const Text('   APNA\n KITCHEN'),
                SignInButton(
                  Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () {
                    context.read<LogInAuth>().googleLogIn(context);
                   
                  },
                ),
                const Text('By loging in you are agreeing yo our'),
                const Text('Terms and Privacy Policy'),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
