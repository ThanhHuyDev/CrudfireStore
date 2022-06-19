import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/app_user.dart';
import '../../../models/country.dart';
import '../../../repositories/authentication_repositories.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState(status: SignInStatus.initial));

  final _authenticationRepository = AuthenticationRepostory();

  void phoneNumberChanged(String phone) {
    emit(state.copyWith(phoneNumber: phone));
  }

  void otpChanged(String otp) {
    emit(state.copyWith(otp: otp));
  }

  void countryChanged(Country country) {
    emit(
      state.copyWith(country: country),
    );
  }

  void saveUserProfile(AppUser user) async {
    emit(state.copyWith(status: SignInStatus.profileUpdateInProgress));
    await _authenticationRepository.saveProfile(user);
    emit(state.copyWith(status: SignInStatus.profileUpdateComplete));
  }

  Future<void> verifyPhoneNumber() async {
    try {
      User? user = await _authenticationRepository.VerifyPhoneNumber(
          verificationId: state.verificationId!, smsCode: state.otp!);
      if (user != null) {
        emit(state.copyWith(status: SignInStatus.otpVerificationSuccess));
        //save user to database
        emit(state.copyWith(status: SignInStatus.authenticated));
      }
    } catch (e) {
      emit(state.copyWith(status: SignInStatus.exception, error: e.toString()));
    }
  }

  void sendOtp() async {
    String phoneNumber = state.phoneNumber!;
    if (phoneNumber.isNotEmpty && phoneNumber[0] == '0') {
      phoneNumber = phoneNumber.substring(1);
    }

    final phoneNumberTxt = ((state.country?.dialCode ?? '+84') + phoneNumber);
    await _authenticationRepository.sendOtp(
        phoneNumber: phoneNumberTxt,
        phoneVerificationCompleted: phoneVerificationCompleted,
        phoneVerificationFailed: phoneVerificationFaied,
        phoneCodeSent: phoneCodeSent,
        autoRetrievalTimeout: autoRetrievalTimeout,
        timeOut: const Duration(seconds: 10));
  }

  void phoneVerificationCompleted(AuthCredential credential) async {
    try {
      User? user =
          await _authenticationRepository.signInWithCredential(credential);
      if (user != null) {
        emit(state.copyWith(status: SignInStatus.otpVerificationSuccess));
        //save user to database
        emit(state.copyWith(status: SignInStatus.authenticated));
      }
    } catch (e) {
      emit(state.copyWith(status: SignInStatus.exception, error: e.toString()));
    }
  }

  void phoneVerificationFaied(FirebaseAuthException exception) {
    emit(state.copyWith(
        status: SignInStatus.exception,
        error: exception.stackTrace.toString()));
  }

  void phoneCodeSent(String verificationId, int? forceResendToken) {
    emit(state.copyWith(
        verificationId: verificationId,
        forceResendToken: forceResendToken,
        status: SignInStatus.otpSent));
  }

  void autoRetrievalTimeout(String verificationId) {
    emit(state.copyWith(verificationId: verificationId));
  }

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(status: SignInStatus.authInProgress));
    try {
      User? user = await _authenticationRepository.signInWithGoogle();
      if (user != null) {
        emit(state.copyWith(
            status: SignInStatus.googleAuthenticated, user: user));
      }
    } catch (e) {
      emit(state.copyWith(
          status: SignInStatus.exception, error: e.toString(), user: null));
    }
  }
}
