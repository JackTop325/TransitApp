import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';

class TextInput extends StatefulWidget {
  final String label;
  final String? placeholder;
  final bool? isPassword;
  const TextInput({
    super.key,
    required this.label,
    this.placeholder,
    this.isPassword = false,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword == true ? true : false,
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: ibmGray80,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ibmGreen50, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ibmGray50, width: 2.0),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ibmGray20, width: 2.0),
          ),
          hintText: widget.placeholder),
    );
  }
}
