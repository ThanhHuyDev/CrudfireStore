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
  final User? user;
  final AppUser? appUser;
  final Country? country;
  
  const SignInState({
    this.status,
    this.error,
    this.phoneNumber,
    this.verificationId,
    this.forceResendToken,
    this.user,
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
    User? user,
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
      user: user ?? this.user,
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
        user,
        appUser,
        otp,
        country,
  ];
}
