part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
final class SettingsSuccess extends SettingsState {}
final class SettingsLoading extends SettingsState {}
final class SettingsFailuer extends SettingsState {
  final String e;

  SettingsFailuer({required this.e});

}




final class SettingsTheme extends SettingsState {}
final class SettingsLanguage extends SettingsState {
  final bool isAr;

  SettingsLanguage({required this.isAr});
}
