class AlarmaClass {
  String alarmid;
  String wid;
  String Name;
  String cType;
  String cDateID;
  int arrange;
  AlarmaClass(
  this.alarmid,
      this.wid,
  this.Name,
  this.cType,
      this.cDateID,
      this.arrange,

      );
  AlarmaClass.fromJson(Map model) {
    this.alarmid = model["alarmid"];
    this.Name = model["Name"];
    this.cType = model["cType"];
    this.cDateID = model['cDateID'];
    this.arrange = model['arrange'];
  }

}
