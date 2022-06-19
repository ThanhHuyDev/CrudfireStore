import 'package:crudfirestore/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
abstract class BaseAuthenticationProvider {
  Future<bool> isLoggedIn();

  Future<User?> signInWithGoogle();

  Future<void> sendOtp({
    required String phoneNumber,
    required PhoneVerificationCompleted phoneVerificationCompleted,
    required PhoneVerificationFailed phoneVerificationFailed,
    required PhoneCodeSent phoneCodeSent,
    required PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout,
    required Duration timeOut,
    int? forceResendToken,
  });

  Future<User?> VerifyPhoneNumber(
      {required String verificationId, required String smsCode});

  Future<User?> signInWithCredential(AuthCredential credential);

  Future<void>saveProfile(AppUser user);
}
