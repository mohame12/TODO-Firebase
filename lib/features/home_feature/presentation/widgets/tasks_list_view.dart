import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/core/utils/my_color.dart';
import 'package:todo2/core/utils/my_style.dart';
import 'package:todo2/features/home_feature/presentation/manger/get_tasks/get_tasks_cubit.dart';
import 'package:todo2/features/home_feature/presentation/widgets/task_section_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TaskListView extends StatelessWidget {
  const TaskListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetTasksCubit,GetTasksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        if(state is GetTasksSuccess)
     {
       if(state.task.isNotEmpty) {
         return Expanded(
           child: Padding(
             padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
             child: ListView.separated(
               physics: const BouncingScrollPhysics(),
               scrollDirection: Axis.vertical,
               itemCount: state.task.length,
               itemBuilder: (context, index) =>
                   TaskSectionItem(taskModel: state.task[index],),
               separatorBuilder: (BuildContext context, int index) {
                 return const SizedBox(height: 10,);
               },),
           ),
         );
       }else
         {
           return Expanded(
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.inbox,
                     size: 50,
                     color: Colors.grey,
                   ),
                   const SizedBox(height: 20),
                   Text(
                     AppLocalizations.of(context)!.noTasks,
                     textAlign: TextAlign.center,
                     style: MyStyle.textStyle20.copyWith(color: Colors.grey),
                   ),
                 ],
               ),
             ),
           );
         }
     } else if(state is GetTasksLoading)
          {
            return  Expanded(
              child: Center(child: CircularProgressIndicator(
                backgroundColor: blueColor,
              )),
            );
          }
        else if(state is GetTasksFailer)
          {
            return Center(child: Text(state.e.toString(),style: MyStyle.textStyle20,));
          }else {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inbox,
                    size: 50,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'No tasks available yet.\nPlease add a new task.',
                    textAlign: TextAlign.center,
                    style: MyStyle.textStyle20.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }

      },
    );
  }
}