class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? starttTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task({this.id, this.title, this.note, this.isCompleted, this.date,
      this.starttTime, this.endTime  ,this.color , this.remind , this.repeat}) ;

  Task.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title=json["title"];
    note=json["note"];
    isCompleted=json["isCompleted"];
    date=json["date"];
    starttTime=json["starttTime"];
    endTime=json["endTime"];
    color=json["color"];
    remind=json["remind"];
    repeat=json["repeat"];
  }

  Map<String, dynamic> toJson() {
    final Map <String, dynamic> data=new Map <String, dynamic>();
    data["id"]=this.id;
    data["title"]=this.title;
    data["note"]=this.note;
    data["isCompleted"]=this.isCompleted;
    data["date"]=this.date;
    data["starttTime"]=this.starttTime;
    data["endTime"]=this.endTime;
    data["color"]=this.color;
    data["remind"]=this.remind;
    data["repeat"]=this.repeat;
    return data;

  }

}
