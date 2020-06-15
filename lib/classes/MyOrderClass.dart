class MyOrderClass {
  String wid;
  String Name;
  String title;
  int statusOrder;
  String cadv;
  String curl;
  String cType;
  MyOrderClass(
  this.wid,
      this.Name,
  this.title,
  this.statusOrder,
      this.cadv,
      this.curl,
      this.cType,

      );
  MyOrderClass.fromJson(Map model) {
    this.wid = model["wid"];
    this.Name = model["Name"];
    this.title = model["title"];
    this.statusOrder = model['statusOrder'];
    this.cadv = model['cadv'];
    this.curl = model['curl'];
    this.cType = model['cType'];
  }

}
