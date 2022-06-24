part of 'sign_in_cubit.dart';
enum SignInStatus{
  initial,
  authInProgress,
  googleAuthenticated,
  otpSent,
  pendingOtpVerification,
  otpVerificationSuccess,
  otpVerificationFailure,
  exception,
  authenticated,
  unauthenticated,
  profileUpdateInProgress,
  profileUpdateComplete,
}

class SignInState extends Equatable {
  final SignInStatus? status;
  final String? error, phoneNumber, verificationId, otp;
  final int? forceResendToken;
  final GoogleSignInAccount? account;
  final AppUser? appUser;
  final Country? country;
  
  const SignInState({
    this.status,
    this.error,
    this.phoneNumber,
    this.verificationId,
    this.forceResendToken,
    this.account,
    this.appUser,
    this.otp,
    this.country
  });

  
  SignInState copyWith({
    SignInStatus? status,
    String? error,
    phoneNumber,
    verificationId,
    int? forceResendToken,
    GoogleSignInAccount? account,
    AppUser? appUser,
    String? otp,
    Country? country,
  }) {
    return SignInState(
      status: status ?? this.status,
      error: error ?? this.error,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      verificationId: verificationId ?? this.verificationId,
      forceResendToken: forceResendToken ?? this.forceResendToken,
      account: account ?? this.account,
      appUser: appUser ?? this.appUser,
      otp: otp ?? this.otp,
      country: country ?? this.country,
    );
  }
  @override
  List<Object?> get props => [
     status,
        error,
        phoneNumber,
        verificationId,
        forceResendToken,
        account,
        appUser,
        otp,
        country,
  ];
}
