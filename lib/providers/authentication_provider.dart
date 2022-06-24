import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirestore/models/app_user.dart';
import 'package:crudfirestore/providers/base/base_authentication.dart';
import 'package:crudfirestore/screens/sign_in/storage/storage_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationProvider extends BaseAuthenticationProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Future<bool> isLoggedIn() async {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser != null && firebaseUser.uid.isNotEmpty;
  }

  @override
  Future<GoogleSignInAccount?> signInWithGoogle() async {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
        final GoogleSignInAuthentication authentication =
            await account!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: authentication.idToken,
            accessToken: authentication.accessToken);
        await _firebaseAuth.signInWithCredential(credential);
       return account;
  }

  @override
  Future<void> sendOtp(
      {required String phoneNumber,
      required PhoneVerificationCompleted phoneVerificationCompleted,
      required PhoneVerificationFailed phoneVerificationFailed,
      required PhoneCodeSent phoneCodeSent,
      required PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout,
      required Duration timeOut,
      int? forceResendToken}) {
    return _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: autoRetrievalTimeout,
        timeout: timeOut,
        forceResendingToken: forceResendToken);
  }

  @override
  Future<User?> VerifyPhoneNumber(
      {required String verificationId, required String smsCode}) {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    return _firebaseAuth
        .signInWithCredential(credential)
        .then((value) => value.user);
  }

  @override
  Future<User?> signInWithCredential(AuthCredential credential) {
    return _firebaseAuth
        .signInWithCredential(credential)
        .then((value) => value.user);
  }

  @override
  Future<void> saveProfile(AppUser user) {
    final firebaseUser = _firebaseAuth.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .set(user.toJson(), SetOptions(merge: true))
        .then((value) async {
      final SharedPreferences _preferences =
          await SharedPreferences.getInstance();
      _preferences.setString('userId', firebaseUser?.uid ?? '');
    });
  }

  @override
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  @override
  Future<void> updateUserPicture(String imageName) async {
    String downloadUrl = await StorageRepository().getDownloadURL(imageName);
    final firebaseUser = _firebaseAuth.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({
      'imageUrl': FieldValue.arrayUnion([downloadUrl]),
    });
  }

  @override
  Future<void> updateUserAvatar(String imageAvatar) async {
    String downloadUrlAvatar =
        await StorageRepository().getDownloadURLAvatar(imageAvatar);
    final firebaseUser = _firebaseAuth.currentUser;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser?.uid)
        .update({
      'imageAvatar': downloadUrlAvatar,
    });
  }
}
