class MyOrderClass {
  String Uid;
  String wid;
  String pid;
  String Name;
  String title;
  String statusOrder;
  String cadv;
  String curl;
  String cType;
  MyOrderClass(
      this.Uid,
      this.wid,
      this.pid,
      this.Name,
  this.title,
  this.statusOrder,
      this.cadv,
      this.curl,
      this.cType,

      );
  MyOrderClass.fromJson(Map model) {
    this.Uid = model["Uid"];
    this.wid = model["wid"];
    this.Name = model["Name"];
    this.title = model["title"];
    this.statusOrder = model['statusOrder'];
    this.cadv = model['cadv'];
    this.curl = model['curl'];
    this.cType = model['cType'];
  }

}
