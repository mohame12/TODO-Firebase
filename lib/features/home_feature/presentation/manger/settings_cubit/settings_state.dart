part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
final class SettingsTheme extends SettingsState {}
final class SettingsLanguage extends SettingsState {
  final bool isAr;

  SettingsLanguage({required this.isAr});
}
