import 'package:crudfirestore/screens/home/home_screens.dart';
import 'package:crudfirestore/screens/sign_in/cubits/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../setup_profile/setup_profile.dart';
import 'components/login_account.dart';

class SignInScreens extends StatefulWidget {
  const SignInScreens({Key? key}) : super(key: key);

  @override
  State<SignInScreens> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreens>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
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
                      Text('Đang tải email...'),
                      CircularProgressIndicator()
                    ],
                  )));
              }
              if (state.status == SignInStatus.googleAuthenticated) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Đăng nhập google thành công...'),
                          Icon(Icons.check)
                        ],
                      )));
                _tabController?.animateTo(1);
              }
              if (state.status == SignInStatus.exception) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      backgroundColor: Colors.red,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.error ?? 'Đăng nhập thất bại'),
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
                      content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Profile update success...'),
                      CircularProgressIndicator()
                    ],
                  )));
              }
              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => const HomeScreens()));
            },
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const LoginAccount(),
                HomeScreens(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
