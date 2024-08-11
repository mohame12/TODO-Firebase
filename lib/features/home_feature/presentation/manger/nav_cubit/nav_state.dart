part of 'nav_cubit.dart';

@immutable
sealed class NavState {}

final class NavInitial extends NavState {}
final class NavChange extends NavState {}
