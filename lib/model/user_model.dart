
class User{
  String email;
  String name;
  String phone;
  String password;
  // ignore: non_constant_identifier_names
  String confirm_pass;
  // ignore: non_constant_identifier_names
  User({this.email,this.name,this.phone,this.password,this.confirm_pass});
  User.from({this.email,this.password});
  User.fromJson(Map<String,dynamic> json):
        email=json["email"],
        name=json["name"],
        phone=json['phone'],
        password=json['password'],
        confirm_pass=json['confirm_pass'];
  Map<String,dynamic> toJson(){
    return {
      'email':email,
      'name':name,
      'phone':phone,
      'password':password,
      'confirm_pass':confirm_pass}
    ;
  }
}

