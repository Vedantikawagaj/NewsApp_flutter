class SignUpResponseModel{
  final String success;

  SignUpResponseModel({
    this.success,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json){
    
    return SignUpResponseModel(
      
      success: json["Success"] != null? json["Success"]: "",
      );
  }

}

class SignUpRequestModel{
  String email;
  String username;
  String password;
  String passwordConf;

  SignUpRequestModel({
    this.email,
    this.username,
    this.password,
    this.passwordConf,

  });

    Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email.trim(),
      'username': username.trim(),
      'password': password.trim(),
      'passwordConf': passwordConf.trim(),
    };

    return map;
  }

}