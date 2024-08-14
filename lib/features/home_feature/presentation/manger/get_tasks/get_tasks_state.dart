part of 'get_tasks_cubit.dart';

@immutable
sealed class GetTasksState {}

final class GetTasksInitial extends GetTasksState {}
final class GetTasksLoading extends GetTasksState {}
final class GetTasksSuccess extends GetTasksState {
  final List<TaskModel>task;

  GetTasksSuccess({required this.task});
}
final class GetTasksFailer extends GetTasksState {
  final String e;

  GetTasksFailer({required this.e});
}


final class TimeLine extends GetTasksState {}
