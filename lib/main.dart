

import 'package:flutter/material.dart';
import 'package:project/Helper/FavHelper.dart';
import 'package:project/Helper/Sign_InHelper.dart';
import 'package:project/Helper/Sign_UpHelper.dart';
import 'package:project/Model/Sign_InModel.dart';
import 'package:provider/provider.dart';
import 'Homepage.dart';
import 'Model/Sign_UpModel.dart';
import 'NewsFeed.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
          create: (context)=> FavItems(),
          child: NewsApp())
      );
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App using API',
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String email = '';
  String pass = '';
  String success = '';
  int _pageState =1;
  var _bgcolor= Colors.white;

  double WindowHeight =0;
  double WindowWidth =0;

  double _signup_width = 0;
  double _signupHeight = 0;
  double _signinHeight = 0;

  double mainpage_yoffset = 0;
  double signup_yoffset = 0;
  double signin_yoffset = 0;

  GlobalKey<FormState> globalFormKey_SignUp = GlobalKey<FormState>();
  SignUpRequestModel signupRequestModel;
  bool isApiCallProcess_signUp = false;

  GlobalKey<FormState> globalFormKey_SignIn = GlobalKey<FormState>();
  SignInRequestModel signInRequestModel;
  bool isApiCallProcess_signin = false;
  @override
  void initState(){
    signupRequestModel = SignUpRequestModel();
    signInRequestModel = SignInRequestModel();
  }
  @override
  Widget build(BuildContext context) {
    WindowHeight = MediaQuery.of(context).size.height;
    WindowWidth = MediaQuery.of(context).size.width;

    _signupHeight = WindowHeight - 270;
    _signinHeight = WindowHeight -270;
    switch(_pageState){
      case 0:
          _bgcolor = Colors.white;
          signup_yoffset = WindowHeight;
          _signup_width = WindowWidth;
          signin_yoffset = WindowHeight;

          break;

      case 1:
          _bgcolor = Color(0xff6C63FF);
          signup_yoffset = 150;
          _signup_width = WindowWidth;
          signin_yoffset = WindowHeight;
          break;

      case 2:
          _bgcolor = Color(0xff6C63FF);
          signup_yoffset = 115;
          _signup_width = WindowWidth;
          signin_yoffset = 130;
          break; 
    }
    return Scaffold(
    backgroundColor: _bgcolor,
    body: Stack(
    
    children: [
      //firstpage
      AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            seconds: 1,
          ),
        transform: Matrix4.translationValues(0, mainpage_yoffset, 1),
        color: _bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            GestureDetector(
              onTap: (){
                setState(() {
                  _pageState=0;

                });

              },
              child: Container(
                child: Column(
                  children: [
                  
                  AnimatedContainer(
                    curve: Curves.fastLinearToSlowEaseIn,
                    duration: Duration(
                      seconds: 1,
                    ),

                    margin: EdgeInsets.only(top: 50),
                    child: Text('Welcome!',style: TextStyle(color: Color(0xff6C63FF),
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                      ),
                    ),


                  ),
              ],),),
            ),

            Container(
              child: Center(
                child: Image.asset('assets/image2.png'),
                // child: Image.asset('assets/undraw_online_articles_79ff.png'),
                ),
              
            ),

            Container(
              padding: EdgeInsets.all(20),
              
              child: GestureDetector(
                onTap:(){

                  setState((){
                    if(_pageState!=0){
                      _pageState =0;
                      print('$_bgcolor, $_pageState');
                    }
                    else{
                      _pageState =1;
                      print('$_bgcolor, $_pageState');
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                        color: Color(0xff6C63FF),
                        borderRadius: BorderRadius.circular(50)
                        ),
                        child:
                        Center(

                            child: Text(
                              'Lets Get Started!!',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                  ),

              ),
     
            ],
        ),
      ),
     
     //Sign up page
     SingleChildScrollView(
                child: AnimatedContainer(
         padding: EdgeInsets.all(30),
          width: WindowWidth,
          height: WindowHeight,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(
            seconds: 1,
          ),

          transform: Matrix4.translationValues(0, signup_yoffset, 1),
          decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft:Radius.circular(15),
              topRight: Radius.circular(15)
          )
    ),

    child: Form(
        key: globalFormKey_SignUp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                "Sign Up",
                style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                ),
              ),
              ),
               Container(
                decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black54,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(50)
            ),
                child: Row(children: [
                  Container(
                  width: 60,
                  child: Icon(Icons.email,
                      size: 25,
                      color: Color(0xFFBB9B9B9)),

                ),

                Expanded(
                  child: TextFormField(
                    onSaved: (input) => signupRequestModel.email= input,
                   decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),

                    border: InputBorder.none,
                    hintText: 'Enter Your Email Id'
                  ),   
                  
                  validator: (input) => !input.contains('@')
                  ? "Email Id should be valid"
                  : null,
                  
                ),
                
                )
                ],),      
              ),
              SizedBox(height: 10), 
              Container(
                decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black54,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(50)
            ),
                child: Row(children: [
                  Container(
                  width: 60,
                  child: Icon(Icons.verified_user,
                      size: 25,
                      color: Color(0xFFBB9B9B9)),

                ),

                Expanded(
                  child: TextFormField(
                    onSaved: (input)=> signupRequestModel.username = input,
                   decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),

                    border: InputBorder.none,
                    hintText: 'Enter Your Username'
                  ),   
                  
                     validator: (value) => value.length < 6
                      ? "Username should be more than 6 characters"
                      : null,
                  
                ),
                
                )
                ],),      
              ),

            SizedBox(height: 10),

            Container(
                decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black54,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(50)
            ),
                child: Row(children: [
                  Container(
                  width: 60,
                  child: Icon(Icons.vpn_key,
                      size: 25,
                      color: Color(0xFFBB9B9B9)),

                ),

                Expanded(
                  child: TextFormField(
                    onSaved: (input)=> signupRequestModel.password= input,
                   decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),

                    border: InputBorder.none,
                    hintText: 'Enter Your Password'
                  ),   
                  
                     validator: (input) => input.length < 6
                    ? "Password should be more than 6 characters"
                    : null,
                ),
                
                )
                ],),      
              ),

              SizedBox(height: 10,),

              Container(
                decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black54,
                    width: 2
                ),
                borderRadius: BorderRadius.circular(50)
            ),
                child: Row(children: [
                  Container(
                  width: 60,
                  child: Icon(Icons.vpn_key,
                      size: 25,
                      color: Color(0xFFBB9B9B9)),

                ),

                Expanded(
                  child: TextFormField(
                   decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10),

                    border: InputBorder.none,
                    hintText: 'Re-enter Password'
                  ),   
                  onSaved: (input) => signupRequestModel.passwordConf= input,
                     validator: (input) => signupRequestModel.password!=signupRequestModel.passwordConf
                                  ? "Both passwords should be same"
                                  : null,
                ),
                
                )
                ],),      
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                  
                  ),
                  InkWell(

                  onTap: (){
                    print('signup-> sign in tapped');
                    setState(() {
                      _pageState =2;
                    });

                  },
                  child: Align(

                      alignment: Alignment.centerRight,
                      child: Text(
                        'Sign in   ',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.orange,
                        ),

                      )
                  )
          ),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: (){
                  
                  if(validateSignUp()){
                    print(signupRequestModel.toJson());

                    setState(() {
                      isApiCallProcess_signUp = true;
                    });
                      SignUpHelper signUpHelper = SignUpHelper();
                      signUpHelper.SignUp(signupRequestModel).then((value){
                          if(value != null){
                            setState(() {
                              isApiCallProcess_signUp = false;
                            });
                            print(value.success);
                          if(value.success== 'You are registered,You can login now.'){
                            final snackBar = SnackBar(content:Text(value.success, textAlign: TextAlign.center,),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            setState(() {
                              _pageState = 2;
                              print('sign in after sign up');
                            });
                            //Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Homepage()));

                          }  
                          else{
                            final snackBar = SnackBar(content: Text(value.success,textAlign: TextAlign.center,));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            globalFormKey_SignUp.currentState.reset();
                            // setState(() {
                            //   _pageState = 1;
                            // });
                            
                          }
                          }
                      });
                  } 

                  
                },
                child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff6C63FF),
                    borderRadius: BorderRadius.circular(50)
                ),
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(

                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      // fontWeight: FontWeight.bold,

                    ),
                  ),
                ),
                ),
              ),
              
            ],)
          ],
        ),
    ),
       ),
     ),

    //Sign in
     AnimatedContainer(
       height: _signinHeight,
        padding: EdgeInsets.all(20),
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(
          seconds: 1,
        ),
        transform: Matrix4.translationValues(0, signin_yoffset, 1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(35),
                topRight: Radius.circular(35)
            )
        ),

        child: Form(
      key: globalFormKey_SignIn,    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
              "Sign In",
              style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              ),
            ),
            ),

            Container(
              decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black54,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(50)
          ),
              child: Row(children: [
                Container(
                width: 60,
                child: Icon(Icons.verified_user,
                    size: 25,
                    color: Color(0xFFBB9B9B9)),

              ),

              Expanded(
                child: TextFormField(
                 decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),

                  border: InputBorder.none,
                  hintText: 'Enter Your Email'
                ),   
                onSaved: (input) => signInRequestModel.email =input,
                   validator: (input) => !input.contains('@')
                                ? "Enter valid email"
                                : null,
              ),
              
              )
              ],),      
            ),

          SizedBox(height: 10),

          Container(
              decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black54,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(50)
          ),
              child: Row(children: [
                Container(
                width: 60,
                child: Icon(Icons.vpn_key,
                    size: 25,
                    color: Color(0xFFBB9B9B9)),

              ),

              Expanded(
                child: TextFormField(
                 decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10),

                  border: InputBorder.none,
                  hintText: 'Enter Your Password'
                ),   
                onSaved: (input)=> signInRequestModel.password = input,
                   validator: (input) => input.length < 6
                                ? "Password should be more than 6 characters"
                                : null,
              ),
              
              )
              ],),      
            ),

            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                style: TextStyle(
                  fontSize: 15,
                ),
                ),
                InkWell(

                onTap: (){
                  print('sign in-> Sign up clicked');
                  setState(() {
                    _pageState =1;
                  });

                },
                child: Align(

                    alignment: Alignment.centerRight,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.orange,
                      ),

                    )
                )
        ),
              ],
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: (){
                  print('forgot password');
                  

                },
                child: Align(

                    alignment: Alignment.center,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.orange,
                      ),

                    )
                )
            ),
            
            SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                
                if(validateSignIn()){
                  print(signInRequestModel.toJson());

                  setState(() {
                    isApiCallProcess_signin = true;
                  });

                  SignInHelper signInHelper = SignInHelper();
                  signInHelper.signin(signInRequestModel).then((value) {
                    if(value != null){
                      setState((){
                        isApiCallProcess_signin = false;

                      });

                      if (value.success== "Success!") {
                        email = signInRequestModel.email;
                        pass = signInRequestModel.password;
                        success = value.success;

                        final snackBar = SnackBar(
                        content: Text('Signed in Successfully!!',textAlign: TextAlign.center,)
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Homepage()
                        ));
                      }
                      else{
                          final snackBar = SnackBar(content: Text('${value.success}',textAlign: TextAlign.center,));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          globalFormKey_SignIn.currentState.reset();
                      }

                    }
                   
                  });
                }
                // Navigator.push(context, MaterialPageRoute(
                //   builder:(_) => Homepage()
                //   ));
              },
              
              child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff6C63FF),
                  borderRadius: BorderRadius.circular(50)
              ),
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(

                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    // fontWeight: FontWeight.bold,

                  ),
                ),
              ),
              ),
            ),
            
          ],)
        ],
      ),
    ),


     )  
    ],
        ),
      );
  }

  bool validateSignUp(){
    final form = globalFormKey_SignUp.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }

  bool validateSignIn(){
    final form= globalFormKey_SignIn.currentState;
    if(form.validate()){
      form.save();
      return true;
    }
    return false;
  }
 
}
