import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo2/features/home_feature/presentation/manger/update_task/update_tasks_cubit.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_style.dart';
import '../../data/models/task_model.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateTasksCubit(),
      child: BlocConsumer<UpdateTasksCubit, UpdateTasksState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit =BlocProvider.of<UpdateTasksCubit>(context);
          return Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(27),
              child: Row(
                children: [
                  Container(
                    height: double.infinity,
                    width: 4,
                    color:taskModel.isDone?greenColor: blueColor,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(taskModel.title,
                          style: MyStyle.textStyle18.copyWith(
                              color: taskModel.isDone?greenColor:blueColor),),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/Discovery.svg'),
                            const SizedBox(width: 3,),
                            Text(
                              DateTime.fromMillisecondsSinceEpoch(taskModel.date).toString().substring(0,10), style: MyStyle.textStyle12,)
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(flex: 1,),
                  taskModel.isDone?GestureDetector(
                      onTap: ()
                      {
                        cubit.onPressedIsDone(task: taskModel);
                      },
                      child: Text("Done",style: MyStyle.textStyle18.copyWith(color: greenColor),)):
                  ElevatedButton(onPressed: () {
                   cubit.onPressedIsDone(task: taskModel);
                  },
                    style: ElevatedButton.styleFrom(backgroundColor: blueColor),
                    child: const Icon(
                      FontAwesomeIcons.check, color: whiteColor,),)
                ],
              ),
            ),

          );
        },
      ),
    );
  }
}