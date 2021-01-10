import 'package:flutter/material.dart';

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  print(regExp.hasMatch(value));
  return regExp.hasMatch(value);
}

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _email = TextEditingController();

  bool validatePassword(
      String cfnpwd, String pwd, String usernameCheck, String emailCheck) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    Pattern emailPattern = r'^(?=.*?@.)$';
    RegExp emailRegex = new RegExp(emailPattern);
    print(cfnpwd);
    if (usernameCheck.isEmpty) {
      showDialog(
          //barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "Please enter a Username!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          });
      return false;
    } else if (!emailRegex.hasMatch(emailCheck)) {
      showDialog(
          //barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "Please enter a valid E-Mail address!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          });
      return false;
    } else if (cfnpwd.isEmpty) {
      showDialog(
          //barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "Please enter password!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          });
      return false;
    } else if (!regex.hasMatch(cfnpwd)) {
      showDialog(
          //barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "Password should contain at least one upper case, one lower case, one digit(0-9), one Special character(\$, #, @, !,%,^,&,*,(,) )",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          });
      return false;
    } else if (cfnpwd != pwd) {
      showDialog(
          //barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                "Password and Confirm Password are different!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            );
          });
      return false;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: ListView(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.expand(height: 150, width: 150),
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Image.asset("assets/images/DocLeafy_Logo_banner.png"),
              ),
            ),
            Center(
              child: Text(
                "Register",
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
                      controller: _username,
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
                        hintText: 'Your Name.',
                        fillColor: Theme.of(context).primaryColor,
                        labelText: 'Name',
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
                      controller: _email,
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
                        hintText: 'your_email@email.com',
                        fillColor: Theme.of(context).primaryColor,
                        labelText: 'Email',
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
                    child: TextFormField(
                      controller: _pass,
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
                        hintText: "A strong one please!",
                        fillColor: Theme.of(context).primaryColor,
                        labelText: 'Password',
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
                    child: TextFormField(
                      controller: _confirmPass,
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
                        hintText: "Please retype your password!",
                        fillColor: Theme.of(context).primaryColor,
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    //splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      validatePassword(_confirmPass.text, _pass.text,
                          _username.text, _email.text);

                      // print(validatePassword(_confirmPass.text, _pass.text,
                      //     _username.text, _email.text));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Register",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
