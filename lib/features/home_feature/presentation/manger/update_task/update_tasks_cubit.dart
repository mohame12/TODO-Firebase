import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo2/features/home_feature/data/models/task_model.dart';

part 'update_tasks_state.dart';

class UpdateTasksCubit extends Cubit<UpdateTasksState> {
  UpdateTasksCubit() : super(UpdateTasksInitial());

  updateTask({required TaskModel task})
  {
    emit(UpdateTasksLoading());
    FirebaseFirestore.instance.collection('Tasks').doc(task.taskeId).update(task.toJson()).then((val){
      emit(UpdateTasksSuccess());
    }).catchError((e){
      emit(UpdateTasksFailuer(e: e.toString()));
    });
  }



  onPressedIsDone({required TaskModel task})
  {
    task.isDone=!task.isDone;
    updateTask(task: task);
  }

  DateTime selectedDate = DateTime.now();

  timePicker({required BuildContext context,required TaskModel model}) async {
    emit(UpdateTimeStart());
    DateTime? date = await showDatePicker(
        context: context,
        initialDate:DateTime.fromMillisecondsSinceEpoch(model.date),
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 10000)));
    if (date != null) {
      selectedDate = date;
      emit(UpdateTime());
    }else
      {
        selectedDate=DateTime.fromMillisecondsSinceEpoch(model.date);
      }
  }

}
