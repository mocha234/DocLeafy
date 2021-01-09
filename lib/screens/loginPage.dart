import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
                    child: TextField(
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
                    onPressed: () {},
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
