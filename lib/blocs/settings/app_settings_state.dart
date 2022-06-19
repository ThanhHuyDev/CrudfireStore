part of 'app_settings_bloc.dart';

abstract class AppSettingsState extends Equatable {
  const AppSettingsState();
  
  @override
  List<Object> get props => [];
}

class UnInitalziedState extends AppSettingsState {
  @override
  List<Object> get props => [];
}

class ThemeState extends AppSettingsState {
  final AppTheme appTheme;
  const ThemeState(this.appTheme);
  @override
  List<Object> get props => [appTheme];
}
