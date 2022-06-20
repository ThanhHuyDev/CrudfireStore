// @dart=2.9
import 'package:crudfirestore/blocs/authentication/authentication_bloc.dart';
import 'package:crudfirestore/blocs/settings/app_settings_bloc.dart';
import 'package:crudfirestore/repositories/authentication_repositories.dart';
import 'package:crudfirestore/screens/sign_in/signin_screens.dart';
import 'package:crudfirestore/screens/splash_screens/splash_screens.dart';
import 'package:crudfirestore/utils/app_palette.dart';
import 'package:crudfirestore/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/home_screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final _authenticationRepostory = AuthenticationRepostory();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AppSettingsBloc>(
      create: (context) => AppSettingsBloc()..add(InitAppSettings()),
    ),
    BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(_authenticationRepostory)
          ..add(IsAuthenticated()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        AppTheme _appTheme;
        if (state is ThemeState) {
          _appTheme = state.appTheme;
        }
        return MaterialApp(
          title: AppConstants.appName,
          theme: AppPalette.themeData[_appTheme] ??
              AppPalette.themeData[AppTheme.dartBlueTheme],
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                // return const SplashScreens();
            if (state is Authenticated) {
              return const HomeScreenss();
            } else if (state is UnAuthenticated) {
              return const SignInScreens();
            } else {
              return const SplashScreens();
            }
          }),
        );
      },
    );
  }
}
