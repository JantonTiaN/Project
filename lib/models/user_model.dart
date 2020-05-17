class UserModel{

  String address, citizenID, drugAllergy, eMail, firstName, lastName, sex, tel, userID;


  UserModel(this.address, this.citizenID, this.drugAllergy, this.eMail, this.firstName, this.lastName, this.sex, this.tel, this.userID);


  UserModel.fromMap(Map<String, dynamic> map){
    address = map['address'];
    citizenID = map['citizenID'];
    drugAllergy = map['drugAllergy'];
    eMail = map['eMail'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    sex = map['sex'];
    tel = map['tel'];
    userID = map['userID'];
  }



}