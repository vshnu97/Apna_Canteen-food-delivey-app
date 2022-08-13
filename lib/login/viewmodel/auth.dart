import 'package:apna_canteen/home/view/screen_home.dart';
import 'package:apna_canteen/login/viewmodel/user_prov.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LogInAuth extends ChangeNotifier {
  FirebaseAuth firebase;
  LogInAuth(this.firebase);

  final FirebaseAuth _auth = FirebaseAuth.instance;
 
  Future<String> googleLogIn(BuildContext context) async {
    try {
      final isLogged = await GoogleSignIn().isSignedIn();
      if (isLogged) GoogleSignIn().signOut();
      final result = await GoogleSignIn().signIn();
      if (result == null) {
        return Future.value("Ocurred an error");
      }

 final cred = await result.authentication;
final AuthCredential credential =GoogleAuthProvider.credential(
          accessToken: cred.accessToken, idToken: cred.idToken);


     
  final User? user =  (await _auth.signInWithCredential(credential)).user;

     context.read<UserProvider>().addUserData(
      currentUser: user!,
       userName: user.displayName, 
       userImage: user.photoURL, 
       userEmail: user.email
       );
 
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ScreenHome()));
      return Future.value('');
    } on FirebaseAuthException catch (exe) {
      return Future.value(exe.message);
    }
  }

  pop(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 215, 6, 6),
        margin: const EdgeInsets.all(20),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Text(
            msg,
            style:
                const TextStyle(letterSpacing: 2, fontWeight: FontWeight.w500),
          ),
        )));
  }
}
