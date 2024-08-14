import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/shared_pref/shared_pref.dart';
import '../../../data/models/task_model.dart';
part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitial());

  DateTime dateNow = DateTime.now();
  List<TaskModel> tasks = [];

  void getTasks() {
    emit(GetTasksLoading());
    FirebaseFirestore.instance
        .collection("Tasks")
        .where("id", isEqualTo: UserDataFromStorage.userId)
        .where("date", isEqualTo:DateUtils.dateOnly(dateNow).millisecondsSinceEpoch)
        .snapshots()
        .listen((val) {

      tasks = val.docs.map((doc) => TaskModel.formJson(doc.data())).toList();
      emit(GetTasksSuccess(task: tasks));

    }).onError((error) {
      print("Failed to get tasks: $error");
      emit(GetTasksFailer(e: error.toString()));
    });
  }

  void lineTimeSelectedDate(DateTime selectedDate) {
    dateNow = selectedDate;
    getTasks();
  }
}
