import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo2/features/home_feature/data/models/task_model.dart';

class FireHelper {

  static CollectionReference<TaskModel> getTasksCollection(){
    return
    FirebaseFirestore.instance.collection('tasks').withConverter(
    fromFirestore: (snapshot, options) =>
    TaskModel.formJson(snapshot.data()!),
    toFirestore: (value, options) => value.toJson(),
    );
  }


  static  addTask(TaskModel model) {
    model.uId=getTasksCollection().doc().id;
    getTasksCollection().doc().set(model);
  }
}
