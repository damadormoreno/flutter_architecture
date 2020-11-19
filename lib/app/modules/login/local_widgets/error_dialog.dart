import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String title, message;
  final Function function;
  const ErrorDialog({
    Key key,
    @required this.title,
    @required this.message,
    @required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        FlatButton(
          child: Text("OK"),
          onPressed: function,
        ),
      ],
    );
  }
}
