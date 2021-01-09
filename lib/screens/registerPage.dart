import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        hintText: 'some_email@email.com',
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
                    onPressed: () {},
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
