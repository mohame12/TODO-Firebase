class TaskModel {
   String uId;
   String taskeId;
   String title;
   String subTitle;
   int date;
   bool isDone;

  TaskModel(
      {required this.title,
      required this.subTitle,
      required this.isDone,
      required this.date,
      required this.uId,
      required this.taskeId});

  TaskModel.formJson(Map<String, dynamic> json)
    :this(
        title: json['title'],
        subTitle: json['subTitle'],
        isDone: json['isDone'],
        date: json['date'],
      uId: json['id'],
    taskeId: json['taskId']
    );


  Map<String,dynamic> toJson()
  {
    return
        {
          "title":title,
          "subTitle":subTitle,
          "isDone":isDone,
          "date":date,
          "id":uId,
          "taskId":taskeId
        };
  }
}
