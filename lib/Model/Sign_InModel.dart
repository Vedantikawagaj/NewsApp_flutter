
class SignInResponseModel{
  final String success;
  
  SignInResponseModel({
    this.success,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json){
    // print(json["Success"]);
    return SignInResponseModel(
      success: json["Success"] != null ? json["Success"] : "abc",
       );
  }
}


class SignInRequestModel{

  String email;
  String password;

  SignInRequestModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = {
      'email': email,
      'password': password,

    };
    return map;
  }
}