import 'package:crudfirestore/blocs/settings/app_settings_bloc.dart';
import 'package:crudfirestore/utils/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
          AppTheme? _appTheme;
        if (state is ThemeState) {
          _appTheme = state.appTheme;
        }
          return Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildThemeButton(AppTheme.lightBlueTheme,
                    _appTheme, 'Light Blue'),
                _buildThemeButton(AppTheme.dartBlueTheme,
                    _appTheme, 'Dart Blue'),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _buildThemeButton(
      AppTheme theme, AppTheme? currentTheme, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Radio<AppTheme>(
          groupValue: currentTheme,
          activeColor: Theme.of(context).colorScheme.secondary,
          value: theme,
          onChanged: (AppTheme? _theme) {
            BlocProvider.of<AppSettingsBloc>(context).add(ToggleTheme(_theme!));
          },
        ),
        Text(
          label,
          style:
              Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14.0),
        )
      ],
    );
  }
}
