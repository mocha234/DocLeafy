// import 'package:docleafy/models/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:camera/camera.dart';
import 'categoriesScreen.dart';

Future<String> loginNow({String username, String password}) async {
  print("loginNow");
  var postUri = Uri.parse("http://20.83.176.144:5000/login");
  var request = http.MultipartRequest("POST", postUri);
  request.fields['username'] = username;
  request.fields['password'] = password;
  print("-----------");
  print(username);
  print(password);
  print("-----------");
  print(request);
  print("sent");
  http.Response response = await http.Response.fromStream(await request.send());
  print("Result: ${response.statusCode}");
  print(response.statusCode);
  print(response.body);
  var ff = jsonDecode(response.body);
  print(ff);
  print(ff["message"]);
  print("fffff");
  return ff["message"];
  //return SignIn.fromJson(jsonDecode(response.body));
}

class LoginPage extends StatefulWidget {
  final CameraDescription camera;
  LoginPage({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginUsername = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();
  //Future<SignIn> loginInStat;
  String successOrFail;
  Future<bool> checkLoginStat;

  @override
  void initState() {
    super.initState();
    checkLoginStat = _checkLoginStatus();
  }

  Future<bool> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('loggedIn');
    print("okkk");
    print(loggedIn);
    return loggedIn;
  }

  Future<void> _userSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', true);
    final ifLoggedIn = await _checkLoginStatus();
    print("login?");
    print(ifLoggedIn);
    // if (ifLoggedIn == false) {
    //   setState(() =>
    //   prefs.setBool('loggedIn', true));
    // }
  }

  @override
  Widget build(BuildContext context) {
    //print("boll");
    //print(checkLoginStat);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: ListView(
          children: [
            Container(
              child: Image.asset("assets/images/DocLeafy_Logo_banner.png"),
              padding: EdgeInsets.all(70.0),
            ),
            Center(
              child: Text(
                "Please sign in.",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: loginUsername,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 5.0),
                        ),
                        //hintText: 'your_email@email.com',
                        hintText: 'your username is...',
                        fillColor: Theme.of(context).primaryColor,
                        //labelText: 'Email',
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: loginPassword,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 5.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 5.0),
                        ),
                        hintText: "Keep em' safe!",
                        fillColor: Theme.of(context).primaryColor,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    //splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () async {
                      successOrFail = await loginNow(
                        username: loginUsername.text,
                        password: loginPassword.text,
                      );
                      print("Success or Fail: " + successOrFail);
                      if (successOrFail == "success") {
                        print("Success!");
                        _userSignIn();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoriesScreen(
                              camera: widget.camera,
                            ),
                          ),
                        );
                      } else {
                        print("Invalid Email or Password!");
                        showDialog(
                            //barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  "Invalid Email or Password. Please try again!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              );
                            });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "First time login?",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14.0),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        //splashColor: Colors.transparent,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        textColor: Theme.of(context).primaryColor,
                        color: Theme.of(context).accentColor,
                        padding: const EdgeInsets.all(6.0),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Register",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
