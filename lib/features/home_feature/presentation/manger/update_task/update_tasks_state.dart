part of 'update_tasks_cubit.dart';

@immutable
sealed class UpdateTasksState {}

final class UpdateTasksInitial extends UpdateTasksState {}
final class UpdateTasksSuccess extends UpdateTasksState {}
final class UpdateTasksLoading extends UpdateTasksState {}
final class UpdateTasksFailuer extends UpdateTasksState {
  final String e;

  UpdateTasksFailuer({required this.e});
}
final class UpdateTime extends UpdateTasksState {}
final class UpdateTimeStart extends UpdateTasksState {}
