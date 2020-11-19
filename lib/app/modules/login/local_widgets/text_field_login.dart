import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  final TextInputType tIType;
  final String labelText;
  final Function function;
  final bool obscure;

  const TextFieldLogin({
    Key key,
    @required this.tIType,
    @required this.labelText,
    @required this.function,
    @required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: function,
      keyboardType: tIType,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
