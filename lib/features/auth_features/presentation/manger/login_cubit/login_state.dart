part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginSuccess extends LoginState {
  final String uId;

  LoginSuccess({required this.uId});
}
final class LoginLoading extends LoginState {}
final class LoginFailuer extends LoginState {
  final String e;

  LoginFailuer({required this.e});
}
final class LoginVaildate extends LoginState {}
