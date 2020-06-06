class AlarmClass {
  String userId;
  String Name;
  String cType;
  String timeData;


  AlarmClass.fromJson(Map model) {
    this.userId = model["userId"];
    this.Name = model["Name"];
    this.cType = model["cType"];
    this.timeData = model['timeData'];
  }
}