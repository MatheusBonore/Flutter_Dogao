import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final TextEditingController controller;
  final Iterable<String> autofillHints;
  final TextInputType keyboardType;
  final int maxLength;
  final String labelText;
  final bool obscureText;

  const TextForm({
    Key key,
    @required this.controller,
    this.autofillHints,
    this.keyboardType = TextInputType.text,
    @required this.maxLength,
    @required this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofillHints: widget.autofillHints,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey[350],
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey[350],
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey[350],
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.grey[350],
          ),
        ),
        counterText: '',
        counterStyle: TextStyle(fontSize: 0),
      ),
      obscureText: widget.obscureText,
    );
  }
}
