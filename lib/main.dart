import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FocusNode myFocusNode1;
  FocusNode myFocusNode2;
  FocusNode myFocusNode3;
  FocusNode myFocusNode4;
  var txt1 = TextEditingController();
  var txt2 = TextEditingController();
  var txt3 = TextEditingController();
  var txt4 = TextEditingController();
  @override
  void initState() {
    super.initState();

    myFocusNode1 = FocusNode();
    myFocusNode2 = FocusNode();
    myFocusNode3 = FocusNode();
    myFocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode1.dispose();
    myFocusNode2.dispose();
    myFocusNode3.dispose();
    myFocusNode4.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code validation'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/imgs/img-1.png',
              width: 260.0,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 20.0,
                    child: TextField(
                      showCursor: false,
                      controller: txt1,
                      autofocus: false,
                      autocorrect: false,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      focusNode: myFocusNode1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '-',
                        border: OutlineInputBorder(),
                        counter: Offstage(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                      ),
                      onChanged: (text) {
                        myFocusNode1.addListener(() {
                          if (myFocusNode1.hasFocus && txt1.text.length >= 1) {
                            txt1.selection = TextSelection.fromPosition(
                              TextPosition(offset: txt1.text.length - 1),
                            );
                          }
                        });
                        FocusScope.of(context).requestFocus(myFocusNode2);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      showCursor: false,
                      controller: txt2,
                      autofocus: false,
                      autocorrect: false,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      focusNode: myFocusNode2,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '-',
                        border: OutlineInputBorder(),
                        counter: Offstage(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                      ),
                      onChanged: (text) {
                        FocusScope.of(context).requestFocus(myFocusNode3);
                        myFocusNode2.addListener(() {
                          if (myFocusNode2.hasFocus && txt2.text.length >= 1) {
                            txt2.selection = TextSelection.fromPosition(
                              TextPosition(offset: txt2.text.length - 1),
                            );
                          }
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      showCursor: false,
                      controller: txt3,
                      autofocus: false,
                      autocorrect: false,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      focusNode: myFocusNode3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '-',
                        border: OutlineInputBorder(),
                        counter: Offstage(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                      ),
                      onChanged: (text) {
                        FocusScope.of(context).requestFocus(myFocusNode4);
                        myFocusNode3.addListener(() {
                          if (myFocusNode3.hasFocus && txt3.text.length >= 1) {
                            txt3.selection = TextSelection.fromPosition(
                              TextPosition(offset: txt3.text.length - 1),
                            );
                          }
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      showCursor: false,
                      controller: txt4,
                      autofocus: false,
                      autocorrect: false,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      focusNode: myFocusNode4,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '-',
                        border: OutlineInputBorder(),
                        counter: Offstage(),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                      ),
                      onChanged: (text) {
                        myFocusNode4.addListener(() {
                          if (myFocusNode4.hasFocus && txt4.text.length >= 1) {
                            txt4.selection = TextSelection.fromPosition(
                              TextPosition(offset: txt4.text.length - 1),
                            );
                          }
                        });
                        txt4.text = text;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
