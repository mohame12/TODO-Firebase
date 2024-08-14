import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo2/core/shared_pref/shared_pref.dart';
import 'package:todo2/features/home_feature/data/models/task_model.dart';
import 'package:todo2/features/home_feature/presentation/views/home_screen.dart';

part 'modal_sheet_state.dart';

class ModalSheetCubit extends Cubit<ModalSheetState> {
  ModalSheetCubit() : super(ModalSheetInitial());

  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController discribeController = TextEditingController();

  timePicker({required BuildContext context}) async {
    DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 10000)));
    if (date != null) {
      selectedDate = date;
      emit(ModalSheetchangeState());
    }
  }

  createTask({required BuildContext context}) {
    emit(ModalSheetLoading());

    DocumentReference docRef = FirebaseFirestore.instance.collection("Tasks").doc();
    TaskModel taskModel = TaskModel(
        title: titleController.text,
        subTitle: discribeController.text,
        isDone: false,
        date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
        uId: UserDataFromStorage.userId,
        taskeId: docRef.id);


        docRef.set(taskModel.toJson())
        .then((val) {
      Navigator.pushReplacementNamed(context, HomeScreen.id);
      emit(ModalSheetSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(ModalSheetFailuer(e: e.toString()));
    });
  }
}
