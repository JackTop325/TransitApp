import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ibmGreen50, width: 3.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ibmGray50, width: 3.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ibmGray20, width: 3.0),
          ),
          hintText: 'Mobile Number'),
    );
  }
}
