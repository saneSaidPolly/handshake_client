import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:json_annotation/json_annotation.dart';


import 'jsonClasses.dart';
import 'loginMenu.dart';
import 'createHandshake.dart';
import 'storedValues.dart';
import 'saveValues.dart';




void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Handshake Teststuff',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HandshakeApp(title: 'Handshake'),
    );
  }
}

class HandshakeApp extends StatefulWidget {
  HandshakeApp({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<HandshakeApp> {

  final SaveValues saveValues = new SaveValues();


  bool _tokenCheckedOnFirstStart = false;

  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _goto_NewShake() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewShake()),
    );
  }

  void _goto_Options() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MenuOptions()),
    );
  }


  void _goto_MyHandshakes() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHandshakes()),
    );
  }


  void _goto_MyMessages() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyMessages()),
    );
  }

  void _goto_MenuShop() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MenuShop()),
    );
  }


  void _goto_JoinHandshake() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JoinHandshake()),
    );
  }


  void _goto_LoginMenu() {

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginMenu()),
    );
  }



  Future<void> checkIfUserIsLoggedIn() async {

    String dafuq = await saveValues.readJsonWebToken();

    String fuckMe = userJsonWebToken_storage;
    if ((fuckMe == null)&&(!_tokenCheckedOnFirstStart)) {

      _tokenCheckedOnFirstStart = true;

      Timer.run(() {
        print("switched to login");
        _goto_LoginMenu();
      });

    }

  }






  void getTokenData() async {

    String shit = userJsonWebToken_storage;

    if (shit != null) {

      // set up POST request arguments
      String url = 'https://www.webstuffing.com/entry_point_client_asks_server_about_penguins.php';
      Map<String, String> headers = {"Content-type": "application/json"};

      String json = '{"jsonWebToken": "$shit", "purposeMain": "get_token_details"}';

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
//
//      userJsonWebToken_storage = answerFromServerGlutenFree.sideMessage;
//
//      basicServer_mainNumber_storage = answerFromServerGlutenFree.mainNumber;
//      basicServer_sideNumber_storage = answerFromServerGlutenFree.sideNumber;
//      basicServer_mainMessage_storage = answerFromServerGlutenFree.mainMessage;
//      basicServer_sideMessage_storage = answerFromServerGlutenFree.sideMessage;
//
//
//      fuckThisMan = "Logged in with token: $basicServer_sideMessage_storage";
//
//      saveValues.saveJsonWebToken();


        log(fuckThisMan);
//


      }



    }

  }








  @override
  initState() {

//    String fuckMe = userJsonWebToken_storage;
//    if (fuckMe.length < 5) {
//      Timer(Duration(seconds: 3), () {
//        print("switched to login after 3 seconds");
//        _goto_LoginMenu();
//      });
//    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    checkIfUserIsLoggedIn();

    getTokenData();

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
        title: Text(widget.title),
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

        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            IconButton(
              icon: Icon(Icons.folder),
              tooltip: 'Increase volume by 10',
              onPressed: () {
                setState(() {
                  //     _volume += 10;
                });

                _goto_MyHandshakes();

              },
            ),
            Text('My Handshakes'),

            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {_goto_NewShake();},
              child: const Text(
                  'Create New',
                  style: TextStyle(fontSize: 20)
              ),
            )
          ],
        ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(
                  icon: Icon(Icons.email),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    setState(() {
                      //     _volume += 10;
                    });

                    _goto_MyMessages();

                  },
                ),
                Text('Messages'),

                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {_goto_JoinHandshake(); },
                  child: const Text(
                      'Join Existing',
                      style: TextStyle(fontSize: 20)
                  ),
                )

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                IconButton(
                  icon: Icon(Icons.menu),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    setState(() {
                      //     _volume += 10;
                    });

                    _goto_Options();

                  },
                ),
                Text('Options'),

                Text('Shop'),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    setState(() {
                      //     _volume += 10;
                    });

                    _goto_MenuShop();

                  },
                )
























              ],
            ),



        const SizedBox(height: 30),
        RaisedButton(
          onPressed: () {_goto_LoginMenu();},
          child: const Text(
              'DEBUG: Login Menu',
              style: TextStyle(fontSize: 20)
          ),
        ),

            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {getTokenData();},
              child: const Text(
                  'DEBUG: Token Data',
                  style: TextStyle(fontSize: 20)
              ),
            ),

            const SizedBox(height: 30),
            RaisedButton(
              onPressed: () {saveValues.clearToken();},
              child: const Text(
                  'DEBUG: Clear Token',
                  style: TextStyle(fontSize: 20)
              ),
            ),



            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),





          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



//****************************************************************************
//****************************************************************************
//****************************************************************************
// CREATE NEW SHAKE TEST GEOLOCATION
//****************************************************************************
//****************************************************************************
//****************************************************************************

//****************************************************************************
//****************************************************************************
//****************************************************************************
// Join Handshake
//****************************************************************************
//****************************************************************************
//****************************************************************************
class JoinHandshake extends StatefulWidget {

  final String cow = "Join existing Handshake";

  @override
  State<StatefulWidget> createState() {
    return _JoinHandshake_1();
  }

}

class _JoinHandshake_1 extends State<JoinHandshake> {

  void _backToOldState() {
    Navigator.pop(context);
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



                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Handshake PIN',
                    ),
                  ),


                  const SizedBox(height: 30),
                  RaisedButton(
                    onPressed: () {},
                    child: const Text(
                        'Lookup Handshake PIN',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),




                  Text('Join Handshake',
                    style: Theme.of(context).textTheme.display1,
                  ),

                  FloatingActionButton(
                    onPressed: () {_backToOldState();},
                    heroTag: "btnJoinHandshake1",
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  )


                ]


            )
        )
    );
  }
}


//****************************************************************************
//****************************************************************************
//****************************************************************************
// Options
//****************************************************************************
//****************************************************************************
//****************************************************************************
  class MenuOptions extends StatefulWidget {

  final String cow = "Options";

  @override
  State<StatefulWidget> createState() {
  return _MenuOptions_1();
  }

  }

  class _MenuOptions_1 extends State<MenuOptions> {

    void _backToOldState() {
      Navigator.pop(context);
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


                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text(
                          'Set Language',
                          style: TextStyle(fontSize: 20)
                      ),
                    ),



                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text(
                          'Get Copy of contract as Email',
                          style: TextStyle(fontSize: 20)
                      ),
                    ),

                    const SizedBox(height: 30),
                    RaisedButton(
                      onPressed: () {},
                      child: const Text(
                          'Get copy of anonymous contract as email',
                          style: TextStyle(fontSize: 20)
                      ),
                    ),



                    Text('Options',
                      style: Theme
                          .of(context)
                          .textTheme
                          .display1,
                    ),

                    FloatingActionButton(
                      onPressed: () {
                        _backToOldState();
                      },
                      heroTag: "btnOption1",
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    )


                  ]


              )
          )
      );
    }
  }

//****************************************************************************
//****************************************************************************
//****************************************************************************
// My Handshakes
//****************************************************************************
//****************************************************************************
//****************************************************************************
    class MyHandshakes extends StatefulWidget {

    final String cow = "My Handshakes";

    @override
    State<StatefulWidget> createState() {
    return _MyHandshakes_1();
    }

    }

    class _MyHandshakes_1 extends State<MyHandshakes> {

    void _backToOldState() {
    Navigator.pop(context);
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


      const SizedBox(height: 30),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Goto anonymous Handshakes',
            style: TextStyle(fontSize: 20)
        ),
      ),



      const SizedBox(height: 30),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Vie: Sort by date',
            style: TextStyle(fontSize: 20)
        ),
      ),

      const SizedBox(height: 30),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'View: Calendar',
            style: TextStyle(fontSize: 20)
        ),
      ),






      Text('My Handshakes',
    style: Theme.of(context).textTheme.display1,
    ),

    FloatingActionButton(
    onPressed: () {_backToOldState();},
    heroTag: "btnMyHandshakes1",
    tooltip: 'Increment',
    child: Icon(Icons.add),
    )


    ]


    )
    )
    );
    }
    }

//****************************************************************************
//****************************************************************************
//****************************************************************************
// My Messages
//****************************************************************************
//****************************************************************************
//****************************************************************************
    class MyMessages extends StatefulWidget {

    final String cow = "My Messages";

    @override
    State<StatefulWidget> createState() {
    return _MyMessages_1();
    }

    }

    class _MyMessages_1 extends State<MyMessages> {

    void _backToOldState() {
    Navigator.pop(context);
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


      const SizedBox(height: 30),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Goto anonymous Messages',
            style: TextStyle(fontSize: 20)
        ),
      ),















      Text('My Messages',
    style: Theme.of(context).textTheme.display1,
    ),

    FloatingActionButton(
    onPressed: () {_backToOldState();},
    heroTag: "btnMyMessages1",
    tooltip: 'Increment',
    child: Icon(Icons.add),
    )


    ]


    )
    )
    );
    }
    }



//****************************************************************************
//****************************************************************************
//****************************************************************************
// Shop
//****************************************************************************
//****************************************************************************
//****************************************************************************
    class MenuShop extends StatefulWidget {

    final String cow = "The Shop";

    @override
    State<StatefulWidget> createState() {
    return _MenuShop_1();
    }

    }

    class _MenuShop_1 extends State<MenuShop> {

    void _backToOldState() {
    Navigator.pop(context);
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


      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            '1x Private Message',
            style: TextStyle(fontSize: 20)
        ),
      ),


      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            '1x Private Message w/ paid Answer',
            style: TextStyle(fontSize: 20)
        ),
      ),



      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            '1x override Cooldown',
            style: TextStyle(fontSize: 20)
        ),
      ),





      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Gift 1x Private Message',
            style: TextStyle(fontSize: 20)
        ),
      ),


      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Gift 1x Private Message w/ paid Answer',
            style: TextStyle(fontSize: 20)
        ),
      ),



      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Gift 1x override Cooldown',
            style: TextStyle(fontSize: 20)
        ),
      ),

      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Gift Chocolate',
            style: TextStyle(fontSize: 20)
        ),
      ),

      const SizedBox(height: 10),
      RaisedButton(
        onPressed: () {},
        child: const Text(
            'Gift Softdrink',
            style: TextStyle(fontSize: 20)
        ),
      ),












      Text('Shop',
    style: Theme.of(context).textTheme.display1,
    ),

    FloatingActionButton(
    onPressed: () {_backToOldState();},
    heroTag: "btnShop1",
    tooltip: 'Increment',
    child: Icon(Icons.add),
    )


    ]


    )
    )
    );
    }
    }


//
////****************************************************************************
////****************************************************************************
////****************************************************************************
//// Login Page
////****************************************************************************
////****************************************************************************
////****************************************************************************
//class LoginMenu extends StatefulWidget {
//
//  final String cow = "My Login Menu";
//
//  @override
//  State<StatefulWidget> createState() {
//    return _LoginMenu_1();
//  }
//
//}
//
//class _LoginMenu_1 extends State<LoginMenu> {
//
//
//
//
//
//  void disposeTextController() {
//    // Clean up the controller when the widget is disposed.
//    loginMenu_1_accountnameController.dispose();
//    loginMenu_1_passwordController.dispose();
//
//
//    super.dispose();
//  }
//
//
//  void _backToOldState() {
//    Navigator.pop(context);
//
//  }
//
//
//  void _sendLoginData() {
//
//
//    Future<BasicServerResponse> fetchPost() async {
//      final response =
//      await http.get('https://webstuffing.com/posts/1');
//
//      if (response.statusCode == 200) {
//        // If server returns an OK response, parse the JSON.
//
//
//
//        //do stuff and not use dumb post class
//        return BasicServerResponse.fromJson(json.decode(response.body));
//
//
//
//
//      } else {
//        // If that response was not OK, throw an error.
//        throw Exception('Failed to load post');
//      }
//    }
//
//
//  }
//
//
//  void _loginMenu_1_updateTitleText() {
//    setState(() {
// //     ++_counter;
//    });
//  }
//
//
//
//  Future<BasicServerResponse> fetchPost() async {
//    final response =
//    await http.get('https://jsonplaceholder.typicode.com/posts/1');
//
//    if (response.statusCode == 200) {
//      // If server returns an OK response, parse the JSON.
//      return BasicServerResponse.fromJson(json.decode(response.body));
//    } else {
//      // If that response was not OK, throw an error.
//      throw Exception('Failed to load post');
//    }
//  }
//
//
//  void _getLoginToken() async {
//
//    String _name = loginMenu_1_accountnameController.text;
//    String _password = loginMenu_1_passwordController.text;
//
//    // set up POST request arguments
//    String url = 'https://www.webstuffing.com/apply_for_jwt.php';
//    Map<String, String> headers = {"Content-type": "application/json"};
//  //  String json = '{"account": $_name, "password": $_password}';
//
//    String json = '{"account": "$_name", "password": "$_password"}';
//
// //   json = json.toString();
// //   json =  jsonEncode(json);
//  //  var json = jsonEncode(myJSON);
//
//    // make POST request
//    http.Response response = await http.post(url, headers: headers, body: json);
//
//    // check the status code for the result
//    int statusCode = response.statusCode;
//
//    if (statusCode < 200 || statusCode > 400 || json == null) {
//      throw new Exception("Error while fetching data");
//    }
//
//    else {
//
///*
////String responseStuff = jsonDecode(response.body);
//
//String responseStuff;
//responseStuff = response.body;
//
//RegExp searchForThisShit = new RegExp ( r'/(<([^>]+)>)/ig');
//String replaceShit = "";
//
//loginJsonWebToken =  responseStuff.replaceAll(searchForThisShit, replaceShit);
//
//
//loginJsonWebToken.replaceAll(searchForThisShit, replaceShit);
//
////loginJsonWebToken = responseStuff.replaceAllMapped(new RegExp(r'/(<([^>]+)>)/ig'), (match) {
////  return '""';
////});
//      responseStuff.replaceAll(searchForThisShit, replaceShit);
//
//      fuckThisMan = "$responseStuff.replaceAll(searchForThisShit, replaceShit)  BLA: $_name BLUBB: $_password";
//*/
//
//
//
//
//
// BasicServerResponse answerFromServerGlutenFree  =  BasicServerResponse.fromJson(jsonDecode(response.body));
//
//
//
// final JsonDecoder _decoder = new JsonDecoder();
//
//
//      fuckThisMan = "$answerFromServerGlutenFree BLA: $_name BLUBB: $_password";
//
//
//
//
//
//_loginMenu_1_updateTitleText();
//    }
//
//    // this API passes back the id of the new item added to the body
////  String body = response.body;
//    // {
//    //   "title": "Hello",
//    //   "body": "body text",
//    //   "userId": 1,
//    //   "id": 101
//    // }
//
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    // This method is rerun every time setState is called, for instance as done
//    // by the _incrementCounter method above.
//    //
//    // The Flutter framework has been optimized to make rerunning build methods
//    // fast, so that you can just rebuild anything that needs updating rather
//    // than having to individually change instances of widgets.
//    return Scaffold(
//        appBar: AppBar(
//          // Here we take the value from the MyHomePage object that was created by
//          // the App.build method, and use it to set our appbar title.
//          title: Text(widget.cow),
//        ),
//        body: Center(
//          // Center is a layout widget. It takes a single child and positions it
//          // in the middle of the parent.
//            child: Column(
//              // Column is also layout widget. It takes a list of children and
//              // arranges them vertically. By default, it sizes itself to fit its
//              // children horizontally, and tries to be as tall as its parent.
//              //
//              // Invoke "debug painting" (press "p" in the console, choose the
//              // "Toggle Debug Paint" action from the Flutter Inspector in Android
//              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//              // to see the wireframe for each widget.
//              //
//              // Column has various properties to control how it sizes itself and
//              // how it positions its children. Here we use mainAxisAlignment to
//              // center the children vertically; the main axis here is the vertical
//              // axis because Columns are vertical (the cross axis would be
//              // horizontal).
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//
//
//
//
//
//
//
//
//                  Text("$fuckThisMan",
//                      style: TextStyle(
//                          color: Colors.grey[800],
//                          fontWeight: FontWeight.bold,
//                          fontSize: 9)
//                  ),
//
//
//              TextField(
//                controller: loginMenu_1_accountnameController,
//              obscureText: false,
//              decoration: InputDecoration(
//                border: OutlineInputBorder(),
//                labelText: 'Username',
//              ),
//            ),
//
//                  TextField(
//                    controller: loginMenu_1_passwordController,
//                    obscureText: true,
//                    decoration: InputDecoration(
//                      border: OutlineInputBorder(),
//                      labelText: 'Password',
//                    ),
//                  ),
//
//
//                  const SizedBox(height: 30),
//                  RaisedButton(
//                    onPressed: () {_getLoginToken();},
//                    child: const Text(
//                        'Login',
//                        style: TextStyle(fontSize: 20)
//                    ),
//                  ),
//
//
//                  const SizedBox(height: 30),
//                  RaisedButton(
//                    onPressed: () {},
//                    child: const Text(
//                        'Create Account',
//                        style: TextStyle(fontSize: 20)
//                    ),
//                  ),
//
//                  const SizedBox(height: 30),
//                  RaisedButton(
//                    onPressed: () {_loginMenu_1_updateTitleText();},
//                    child: const Text(
//                        'Update title',
//                        style: TextStyle(fontSize: 20)
//                    ),
//                  ),
//
//
//
//
//
//
//
//
//
//
//                  Text('My Messages',
//                    style: Theme.of(context).textTheme.display1,
//                  ),
//
//                  FloatingActionButton(
//                    onPressed: () {_backToOldState();},
//                    heroTag: "btnLoginMenu1",
//                    tooltip: 'Increment',
//                    child: Icon(Icons.add),
//                  )
//
//
//                ]
//
//
//            )
//        )
//    );
//  }
//}




