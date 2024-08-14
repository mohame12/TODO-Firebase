import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());

  deleteTask({required String taskId}) {
    emit(DeleteTaskLoading());

    FirebaseFirestore.instance.collection("Tasks").doc(taskId).delete().then((val) {
      if (!isClosed) {
        emit(DeleteTaskSucces());
      }
    });
  }

}
