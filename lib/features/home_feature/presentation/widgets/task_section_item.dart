import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo2/features/home_feature/data/models/task_model.dart';
import 'package:todo2/features/home_feature/presentation/manger/delete_task/delete_task_cubit.dart';
import 'delete_slidable.dart';
import 'edite_slidable.dart';
import 'my_card.dart';
class TaskSectionItem extends StatelessWidget {
  const TaskSectionItem({
    super.key, required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.18,
      width: MediaQuery.of(context).size.width,

      child: BlocProvider(
  create: (context) => DeleteTaskCubit(),
  child: Slidable(
        startActionPane: ActionPane(
            motion: const Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 10),
              child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(10),bottomStart: Radius.circular(10)),
                  child: StretchMotion()),
            ),
            children: [
          EditSlidable(taskModel: taskModel,),
        ]),
        endActionPane: ActionPane(
            motion: const Padding(
              padding: EdgeInsetsDirectional.symmetric(vertical: 10),
              child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.only(topEnd:Radius.circular(10) ,bottomEnd:Radius.circular(10) ),
                  child: StretchMotion()),
            ),
            children: [
          DeleteSlidable(taskModel: taskModel,),
        ]),
        child: MyCard(taskModel: taskModel),
      ),
),
    );
  }
}





