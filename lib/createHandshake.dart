
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
import 'storedValues.dart';
import 'saveValues.dart';





class NewShake extends StatefulWidget {

  final String cow = "New Handshake or List";


  @override
  State<StatefulWidget> createState() {
    return _NewShake_1();
  }

}



class _NewShake_1 extends State<NewShake> {

  //**************************************************************
  //Test Geo
  //**************************************************************

  static const platform_geolocation = const MethodChannel(
      'webstuffing.com/gps');
  String _geolocation = 'Unknown place in time and space, probably near Bitterfeld';

  Future<void> _getGeolocationBitch() async {
    String userPosition;
    try {
      final String result = await platform_geolocation.invokeMethod(
          'getGeolocation');
      userPosition = 'Geolocation: $result';
    } on PlatformException catch (e) {
      userPosition = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _geolocation = userPosition;
    });
  }

  void _backToOldState() {
    Navigator.pop(context);
  }


  void _goto_createDefaultHandshake() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DefaultShake()),
    );
  }


  void _goto_createCustomHandshake() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CustomShake()),
    );
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



                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        IconButton(
                          icon: Icon(Icons.folder),
                          tooltip: 'Increase volume by 10',
                          onPressed: () {
                            _goto_createCustomHandshake();
                          },
                        ),
                        Text('Custom Handshake <--'),

                        Text('--> Default Handshake'),

                        IconButton(
                          icon: Icon(Icons.folder),
                          tooltip: 'Increase volume by 10',
                          onPressed: () {
                            _goto_createDefaultHandshake();
                          },
                        )
                      ]
                  ),







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

                            //  _goto_MyHandshakes();

                          },
                        ),
                        Text('NOTHING <--'),

                        Text('--> Singleton'),

                        IconButton(
                          icon: Icon(Icons.folder),
                          tooltip: 'Increase volume by 10',
                          onPressed: () {
                            setState(() {
                              //     _volume += 10;
                            });

                            //  _goto_MyHandshakes();

                          },
                        )
                      ]
                  ),



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

                            //  _goto_MyHandshakes();

                          },
                        ),
                        Text('List-Participants <--'),

                        Text('--> List-Appointments'),

                        IconButton(
                          icon: Icon(Icons.folder),
                          tooltip: 'Increase volume by 10',
                          onPressed: () {
                            setState(() {
                              //     _volume += 10;
                            });

                            //  _goto_MyHandshakes();

                          },
                        )
                      ]
                  ),










                  Text('Kamele können auch kongruent geklärt werden sagt Karl',
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



class DefaultShake extends StatefulWidget {

  final String newShakeDefault = "New Standard Handshake";


  @override
  State<StatefulWidget> createState() {
    return _DefaultShake();
  }

}


class _DefaultShake extends State<DefaultShake> {

  //**************************************************************
  //Test Geo
  //**************************************************************

  static const platform_geolocation = const MethodChannel(
      'webstuffing.com/gps');
  String _geolocation = 'Unknown place in time and space, probably near Bitterfeld';

  Future<void> _getGeolocationBitch() async {
    String userPosition;
    try {
      final String result = await platform_geolocation.invokeMethod(
          'getGeolocation');
      userPosition = 'Geolocation: $result';
    } on PlatformException catch (e) {
      userPosition = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _geolocation = userPosition;
    });
  }

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
          title: Text(widget.newShakeDefault),
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

                            //  _goto_MyHandshakes();

                          },
                        ),
                        Text('Custom Handshake <--'),

                        Text('--> Default Handshake'),

                        IconButton(
                          icon: Icon(Icons.folder),
                          tooltip: 'Increase volume by 10',
                          onPressed: () {
                            setState(() {
                              //     _volume += 10;
                            });

                            //  _goto_MyHandshakes();

                          },
                        )
                      ]
                  ),







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

                            //  _goto_MyHandshakes();

                          },
                        ),
                        Text('NOTHING <--'),

                        Text('--> Singleton'),

                        IconButton(
                          icon: Icon(Icons.folder),
                          tooltip: 'Increase volume by 10',
                          onPressed: () {
                            setState(() {
                              //     _volume += 10;
                            });

                            //  _goto_MyHandshakes();

                          },
                        )
                      ]
                  ),



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

                            //  _goto_MyHandshakes();

                          },
                        ),
                        Text('List-Participants <--'),

                        Text('--> List-Appointments'),

                        IconButton(
                          icon: Icon(Icons.folder),
                          tooltip: 'Increase volume by 10',
                          onPressed: () {
                            setState(() {
                              //     _volume += 10;
                            });

                            //  _goto_MyHandshakes();

                          },
                        )
                      ]
                  ),










                  Text('Kamele können auch kongruent geklärt werden sagt Karl',
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


class CustomShake extends StatefulWidget {

  final String newShakeCustom = "New Custom Handshake";

  @override
  State<StatefulWidget> createState() {
    return _CustomShake();
  }

}


class _CustomShake extends State<CustomShake> {

  final _CustomShake_TitleController = TextEditingController();
  final _CustomShake_DescriptionController = TextEditingController();

  int _counterMembers = 2;
  String dropdownConfidentiality = 'Default: On police warrant';
  final _CustomShake_NdaPenaltyController = TextEditingController();
  bool ndaVisible = false;

  String dropdownPenalty = 'No penalty';
  String dropdownPenaltyCurrency = 'Euro';
  final _CustomShake_PenaltyController = TextEditingController();
  final _CustomShake_FavourAsPenaltyController = TextEditingController();
  bool penaltyVisible = false;
  bool favourVisible = false;

  //**************************************************************
  //Test Geo
  //**************************************************************

  static const platform_geolocation = const MethodChannel(
      'webstuffing.com/gps');
  String _geolocation = 'Unknown place in time and space, probably near Bitterfeld';

  Future<void> _getGeolocationBitch() async {
    String userPosition;
    try {
      final String result = await platform_geolocation.invokeMethod(
          'getGeolocation');
      userPosition = 'Geolocation: $result';
    } on PlatformException catch (e) {
      userPosition = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _geolocation = userPosition;
    });
  }

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
          title: Text(widget.newShakeCustom),
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

                  Flexible(
                    child: new            TextField(
                      maxLength: 100,
                      autofocus: true,
                      controller: _CustomShake_TitleController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    ),
                  )
                ]
            ),



            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Flexible(
                    child: new            TextField(
                      maxLength: 300,
                      maxLines: 5,
                      controller: _CustomShake_DescriptionController,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                    ),
                  )
                ]
            ),










                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          tooltip: '',
                          onPressed: () {

                            setState(() {
                              if (_counterMembers>2)   {

                                _counterMembers -= 1;

                              }

                            });

                          },
                        ),
                        Text('Members: $_counterMembers'),


                        IconButton(
                          icon: Icon(Icons.arrow_drop_up),
                          tooltip: '',
                          onPressed: () {
                            setState(() {
                          if (_counterMembers<10)   {

                            _counterMembers += 1;

                          }

                            });

                          },
                        )
                      ]
                  ),




                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text('Confidentiality: '),

            DropdownButton<String>(
              value: dropdownConfidentiality,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                  color: Colors.deepPurple
              ),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  if (newValue == 'Public: On request') { ndaVisible = false; }
                  if (newValue ==  'Default: On police warrant') {ndaVisible = false; }
                  if (newValue == 'Secret: NDA') {ndaVisible = true; }

                  dropdownConfidentiality = newValue;
                });
              },
              items: <String>['Public: On request', 'Default: On police warrant', 'Secret: NDA']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              })
                  .toList(),
            )

                      ]
                  ),

                  Visibility(
                      visible: ndaVisible,
                      child:
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [

                          Text('NDA Penalty: '),

                    DropdownButton<String>(
                      value: dropdownPenaltyCurrency,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(
                          color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownPenaltyCurrency = newValue;
                        });
                      },
                      items: <String>['Euro', 'Dollar', 'Bitcoin']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                          .toList(),
                    ),



                    Flexible(
                      child: new            TextField(
                        controller: _CustomShake_NdaPenaltyController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                        ),
                      ),
                    )
]
                  )

                  ),

//                  Row(
//                    children: <Widget>[
//                      new Flexible(
//                        child: new TextField(
//                          decoration: const InputDecoration(helperText: "Enter App ID"),
//                          style: Theme.of(context).textTheme.body1,
//                        ),
//                      ),
//                    ],
//                  ),



                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        Text('Penalty: '),


                        DropdownButton<String>(
                          value: dropdownPenalty,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.deepPurple
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {

                              if (newValue == 'No penalty') { penaltyVisible = false; favourVisible = false; }
                              if (newValue == 'financial penalty') {penaltyVisible = true; favourVisible = false;}
                              if (newValue == 'favour as penalty') {penaltyVisible = false; favourVisible = true;}
                              dropdownPenalty = newValue;
                            });
                          },
                          items: <String>['No penalty', 'financial penalty', 'favour as penalty']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          })
                              .toList(),
                        ),

                      ]
                  ),




            Visibility(
                visible: penaltyVisible,
                child:

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text('Financial Penalty: '),


                      DropdownButton<String>(
                        value: dropdownPenaltyCurrency,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownPenaltyCurrency = newValue;
                          });
                        },
                        items: <String>['Euro', 'Dollar', 'Bitcoin']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      ),

                      Flexible(
                        child: new            TextField(
                          controller: _CustomShake_PenaltyController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                          ),
                        ),
                      ),




                    ]
                )
            ),




            Visibility(
                visible: favourVisible,
                child:      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Text('Favour as Penalty: '),


                      Flexible(
                        child: new            TextField(
                          controller: _CustomShake_FavourAsPenaltyController,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Favour',
                          ),
                        ),
                      ),




                    ]
                )

            ),


                  const SizedBox(height: 10),
                  RaisedButton(
                    onPressed: () {},
                    child: const Text(
                        'Create Handshake',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),




                ]


            )
        )
    );
  }
}

