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

  List<Widget> input_fields = [];

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
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/imgs/img-1.png',
              width: 260.0,
            ),
            Container(
              color: Colors.red,
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: FixedExtentScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 6,
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: txt1,
                      focusNode: myFocusNode1,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      showCursor: false,
                      autofocus: false,
                      autocorrect: false,
                      enableInteractiveSelection: false,
                      textAlign: TextAlign.center,
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
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Function setUpNextFocusTextField() {}
}
