import 'package:crudfirestore/screens/home.dart';
import 'package:crudfirestore/screens/setup_profile/setup_profile.dart';
import 'package:crudfirestore/screens/sign_in/components/phone_auth_view.dart';
import 'package:crudfirestore/screens/sign_in/components/verify_phonenumber.dart';
import 'package:crudfirestore/screens/sign_in/cubits/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPhoneScreens extends StatefulWidget {
  const SignInPhoneScreens({Key? key}) : super(key: key);

  @override
  State<SignInPhoneScreens> createState() => _SignInPhoneScreensState();
}

class _SignInPhoneScreensState extends State<SignInPhoneScreens>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.requestFocus();
        },
        child: Scaffold(
          body: BlocListener<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state.status == SignInStatus.authInProgress) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Authenticating...'),
                      CircularProgressIndicator()
                    ],
                  )));
                _tabController?.animateTo(0);
              }
              if (state.status == SignInStatus.otpSent) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      backgroundColor: Colors.yellow,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [Text('send Otp'), Icon(Icons.check)],
                      )));
                _tabController?.animateTo(1);
              }
              if (state.status == SignInStatus.otpVerificationSuccess) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Otp verified succsecfull...'),
                          Icon(Icons.check)
                        ],
                      )));
                _tabController?.animateTo(2);
              }
              if (state.status == SignInStatus.exception) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.error ?? 'Authentication Error'),
                          const Icon(Icons.error)
                        ],
                      )));
              }
              if (state.status == SignInStatus.profileUpdateInProgress) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Updateprofile...'),
                      CircularProgressIndicator()
                    ],
                  )));
              }
              if (state.status == SignInStatus.profileUpdateComplete) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                      content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Profile update success...'),
                      CircularProgressIndicator()
                    ],
                  )));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomeScreens()));
              }
            },
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const PhoneAuthView(),
                VerifyPhone(),
                SetupProfileScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
