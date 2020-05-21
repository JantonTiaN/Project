class AccountModel{

  String userName, password;


  AccountModel(this.userName, this.password);


  AccountModel.fromMap(Map<String, dynamic> map){
    userName = map['userName'];
    password = map['password'];
  }



}