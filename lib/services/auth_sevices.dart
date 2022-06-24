import 'package:crudfirestore/screens/home/home_screens.dart';
import 'package:crudfirestore/screens/splash_screens/splash_screens.dart';
import 'package:crudfirestore/services/sign_google.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthSevice {
  handlerAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return HomeScreens();
          } else {
            return const SignGoogle();
          }
        });
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? account =
        await GoogleSignIn(scopes: <String>['email']).signIn();
    final GoogleSignInAuthentication googleAuth = await account!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
