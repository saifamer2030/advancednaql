class CoiffureRegDataClass {
  String cId;
  String cEmail;
  String cName;
  String cPhone;


  CoiffureRegDataClass(
      this.cId,
      this.cEmail,
      this.cName,
      this.cPhone,
     );

  CoiffureRegDataClass.fromJson(Map model) {
    this.cId = model["cId"];
    this.cEmail = model["cEmail"];
    this.cName = model["cName"];
    this.cPhone = model["cPhone"];

  }
  String get CId => cId;

  String get CEmail => cEmail;

  String get CName => cName;

  String get CPhone => cPhone;
}
