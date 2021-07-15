import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/Model/Sign_InModel.dart';

class SignInHelper{
  Future<SignInResponseModel> signin(SignInRequestModel requestModel) async{
    String url1 = "https://nodejs-register-login-app.herokuapp.com/login/";
    final response = await http.post(Uri.parse(url1),body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      print('response body: ${response.body}');
      return SignInResponseModel.fromJson(
        json.decode(response.body.toString()),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}


