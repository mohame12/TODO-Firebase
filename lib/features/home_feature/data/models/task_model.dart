class TaskModel
{
  final String title;
  final String subTitle;
  final bool isDone;

  TaskModel({required this.title, required this.subTitle, required this.isDone});

  factory TaskModel.formJson(Map<String,dynamic>json)
  {
    return TaskModel(title:json['title'] , subTitle: json['subTitle'], isDone: json['isDone']);
  }

}