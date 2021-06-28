import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/Model/Sign_UpModel.dart';

class SignUpHelper{
   Future<SignUpResponseModel> SignUp(SignUpRequestModel requestModel) async {
    String url = "https://nodejs-register-login-app.herokuapp.com";

    final response = await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200) {
      
      // print(response.body);
      return SignUpResponseModel.fromJson(
        json.decode(response.body.toString()),
        
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}