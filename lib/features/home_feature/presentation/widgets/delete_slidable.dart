import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo2/features/home_feature/data/models/task_model.dart';
import 'package:todo2/features/home_feature/presentation/manger/delete_task/delete_task_cubit.dart';


class DeleteSlidable extends StatelessWidget {
  const DeleteSlidable({
    super.key, required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteTaskCubit(),
      child: BlocConsumer<DeleteTaskCubit,DeleteTaskState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit=BlocProvider.of<DeleteTaskCubit>(context);
          return SlidableAction(
            onPressed: (val) {
              cubit.deleteTask(taskId:taskModel.taskeId );
            },
            padding: EdgeInsets.zero,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          );
        },
      ),
    );
  }
}