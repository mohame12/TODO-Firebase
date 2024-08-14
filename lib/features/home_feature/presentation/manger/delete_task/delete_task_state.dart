part of 'delete_task_cubit.dart';

@immutable
sealed class DeleteTaskState {}

final class DeleteTaskInitial extends DeleteTaskState {}
final class DeleteTaskSucces extends DeleteTaskState {}
final class DeleteTaskLoading extends DeleteTaskState {}
final class DeleteTaskFailuer extends DeleteTaskState {
  final String e;

  DeleteTaskFailuer({required this.e});
}
