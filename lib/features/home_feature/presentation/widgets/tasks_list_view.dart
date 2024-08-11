import 'package:flutter/material.dart';
import 'package:todo2/features/home_feature/presentation/widgets/task_section_item.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection:Axis.vertical ,
          itemCount: 10,
          itemBuilder: (context, index) => const TaskSectionItem(),
          separatorBuilder: (BuildContext context, int index) {return SizedBox(height: 10,); },),
      ),
    );
  }
}