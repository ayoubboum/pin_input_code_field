library pin_entry_code;

import 'package:flutter/material.dart';

class PinEntryCode extends StatelessWidget {
  PinEntryCode();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class InputField {
  TextEditingController textField;
  FocusNode myFocusNode;

  InputField({this.textField, this.myFocusNode});
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<InputField> input_fields = [];

  @override
  void initState() {
    super.initState();
    input_fields = [
      InputField(textField: TextEditingController(), myFocusNode: FocusNode()),
      InputField(textField: TextEditingController(), myFocusNode: FocusNode()),
      InputField(textField: TextEditingController(), myFocusNode: FocusNode()),
      InputField(textField: TextEditingController(), myFocusNode: FocusNode()),
    ];
  }

  @override
  void dispose() {
    input_fields.forEach((res) => {res.myFocusNode.dispose()});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: input_fields.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            width: 80.0,
            // width:
            //     MediaQuery.of(context).size.width / input_fields.length,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: input_fields[index].textField,
              focusNode: input_fields[index].myFocusNode,
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
                input_fields[index].myFocusNode.addListener(() {
                  if (input_fields[index].myFocusNode.hasFocus &&
                      input_fields[index].textField.text.length >= 1) {
                    input_fields[index].textField.selection =
                        TextSelection.fromPosition(
                      TextPosition(
                          offset:
                              input_fields[index].textField.text.length - 1),
                    );
                  }
                });
                input_fields[index].textField.text = text;
                FocusScope.of(context)
                    .requestFocus(input_fields[index + 1].myFocusNode);
              },
            ),
          );
        },
      ),
    );
  }
}
