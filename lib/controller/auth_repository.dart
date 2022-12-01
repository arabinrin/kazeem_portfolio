
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kazeem_portfolio/pages/main_page.dart';
import 'package:kazeem_portfolio/utils/navigator.dart';
import 'package:kazeem_portfolio/widgets/snackbar.dart';

class AuthRepository {
  //Sign Up
  Future<void> createWithEmailAndPwd(
    String userSignUpEmail,
    String userSignUpPassword,
    BuildContext context,
    // String lName,
    // String phoneNumber,
  ) async {

    try {
        final UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: userSignUpEmail, password: userSignUpPassword);
        await userCredential.user!.sendEmailVerification().then((value) async {

          changeScreenPushUntil(context,  MyHomePage());
          cToast(msg: 'Yay! Signed up Successfully 🤩', context: context);
          
        });
      
    } catch (e) {
      cToast(msg: 'Oops! An error occured.. 😞 \n $e', context: context);
    }
  }

  //Sign In
  Future<void> signInWithEmail(
      String email, String password, BuildContext context) async {
    

    try {
   
       await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((UserCredential value) async {
          
      
          changeScreenPushUntil(context,  MyHomePage());

          cToast(msg: 'Yay! Signed In 🤩', context: context);

          return value;
        });
      
    } catch (e) {
      print(e.toString());
      cToast(
          msg:
              'We cannot find an account with this email and password. Please check your details 😞',
          context: context);
    }
  }

}
