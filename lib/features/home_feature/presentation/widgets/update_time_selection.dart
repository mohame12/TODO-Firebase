import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/features/home_feature/presentation/manger/update_task/update_tasks_cubit.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';
import '../../data/models/task_model.dart';

class UpdateTimeSelection extends StatelessWidget {
  const UpdateTimeSelection({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateTasksCubit, UpdateTasksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit=BlocProvider.of<UpdateTasksCubit>(context);
        return GestureDetector(
            onTap: () {
              cubit.timePicker(context: context, model: model);
            },
            child: Text(state is !UpdateTime?"${DateTime.fromMillisecondsSinceEpoch(model.date)
                .toString()
                .substring(0, 10)}":"${cubit.selectedDate.toString().substring(0,10)}",
              style: MyStyle.textStyle18.copyWith(color: greyColor),));
      },
    );
  }
}