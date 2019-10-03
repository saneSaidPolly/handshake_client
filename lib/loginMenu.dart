import 'jsonClasses.dart';


import 'dart:developer';


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'storedValues.dart';
import 'jsonClasses.dart';
import 'saveValues.dart';


//test
String fuckThisMan = "Not logged in brah";



class LoginMenu extends StatefulWidget {

  final String cow = "My Login Menu";


  @override
  State<StatefulWidget> createState() {
    return _LoginMenu_1();
  }

}




class _LoginMenu_1 extends State<LoginMenu> {

  final SaveValues saveValues = new SaveValues();

  final _loginMenu_1_accountnameController = TextEditingController();
  final _loginMenu_1_passwordController = TextEditingController();


  final _loginMenu_1_setNameController = TextEditingController();
  final _loginMenu_1_emailController = TextEditingController();
  final _loginMenu_1_confirmEmailController = TextEditingController();
  final _loginMenu_1_setPasswordController = TextEditingController();
  final _loginMenu_1_confirmPasswordController = TextEditingController();





  String fuckThisMan = "Hier koennte was stehen";





  void _backToOldState() {
    Navigator.pop(context);

  }



  void _loginMenu_1_updateTitleText() {
    setState(() {
      //     ++_counter;
    });
  }





  void getLoginToken() async {

    String _name = _loginMenu_1_accountnameController.text;
    String _password = _loginMenu_1_passwordController.text;
    String _purposeMain = "user_login";

    // set up POST request arguments
    String url = 'https://www.webstuffing.com/entry_point_client_renew_token.php';
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"stringOne": "$_name", "stringTwo": "$_password", "purposeMain": "$_purposeMain"}';

    // make POST request
    http.Response response = await http.post(url, headers: headers, body: json);

    // check the status code for the result
    int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    else {

      log(response.body);


      BasicServerResponse answerFromServerGlutenFree = BasicServerResponse
          .fromJson(jsonDecode(response.body));


      //   final JsonDecoder _decoder = new JsonDecoder();

      userJsonWebToken_storage = answerFromServerGlutenFree.sideMessage;

      basicServer_mainNumber_storage = answerFromServerGlutenFree.mainNumber;
      basicServer_sideNumber_storage = answerFromServerGlutenFree.sideNumber;
      basicServer_mainMessage_storage = answerFromServerGlutenFree.mainMessage;
      basicServer_sideMessage_storage = answerFromServerGlutenFree.sideMessage;


      fuckThisMan = "Logged in with token: $basicServer_sideMessage_storage";

      saveValues.saveJsonWebToken(userJsonWebToken_storage);


   //   log(fuckThisMan);
//
      _loginMenu_1_updateTitleText();


    }
  }




  void registerNewAccount() async {


    String _newName = _loginMenu_1_setNameController.text;
    String _emailOne = _loginMenu_1_emailController.text;
    String _emailTwo = _loginMenu_1_confirmEmailController.text;
    String _passwordOne = _loginMenu_1_setPasswordController.text;
    String _passwordTwo = _loginMenu_1_confirmPasswordController.text;


    // set up POST request arguments
    String url = 'https://www.webstuffing.com/entry_point_client_create_account.php';
    Map<String, String> headers = {"Content-type": "application/json"};

//    String json = '{"stringOne": "$_newName", "stringTwo": "$_emailOne", "stringThree": "$_emailTwo"}';
    String json = '{"stringOne": "$_newName", "stringTwo": "$_emailOne", "stringThree": "$_emailTwo",  "stringFour": "$_passwordOne",  "stringFive": "$_passwordTwo"}';

    // make POST request
    http.Response response = await http.post(url, headers: headers, body: json);

    // check the status code for the result
    int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    else {

      log(response.body);


      BasicServerResponse answerFromServerGlutenFree = BasicServerResponse
          .fromJson(jsonDecode(response.body));


      //   final JsonDecoder _decoder = new JsonDecoder();

      userJsonWebToken_storage = answerFromServerGlutenFree.sideMessage;

      basicServer_mainNumber_storage = answerFromServerGlutenFree.mainNumber;
      basicServer_sideNumber_storage = answerFromServerGlutenFree.sideNumber;
      basicServer_mainMessage_storage = answerFromServerGlutenFree.mainMessage;
      basicServer_sideMessage_storage = answerFromServerGlutenFree.sideMessage;


      fuckThisMan = "Logged in with token: $basicServer_sideMessage_storage";


      log(fuckThisMan);
//
      _loginMenu_1_updateTitleText();


    }
  }






















  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.cow),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
            child: Column(
              // Column is also layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[



                  Text("$fuckThisMan",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 9)
                  ),


                  TextField(
                    controller: _loginMenu_1_setNameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'My Accountname',
                    ),
                  ),

                  TextField(
                    controller: _loginMenu_1_emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'My Email',
                    ),
                  ),

                  TextField(
                    controller: _loginMenu_1_confirmEmailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Email',
                    ),
                  ),

                  TextField(
                    controller: _loginMenu_1_setPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'My Password',
                    ),
                  ),

                  TextField(
                    controller: _loginMenu_1_confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),


                  const SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () {registerNewAccount();},
                    child: const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),


                  TextField(
                    controller: _loginMenu_1_accountnameController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),

                  TextField(
                    controller: _loginMenu_1_passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),

                  const SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () {getLoginToken();},
                    child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),




                ]


            )
        )
    );
  }
}
