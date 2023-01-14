import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba/widgets/login/verify_code.dart';

void verifyNumber(
  BuildContext context,
  String phoneNumber,
) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth
            .signInWithCredential(credential)
            .then((value) => print('Logeado con exito'));
      },
      verificationFailed: (FirebaseAuthException exception) {
        if (exception.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationID, int? resendToken) async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyCode(
              verificationId: verificationID,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      });
}
