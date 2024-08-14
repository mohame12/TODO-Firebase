part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterSuccess extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterFailuer extends RegisterState {
  final String e;

  RegisterFailuer({required this.e});
}


final class RegisterValidation extends RegisterState {}