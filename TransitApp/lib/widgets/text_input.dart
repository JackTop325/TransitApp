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

  static InputDecoration textInputDecoration(
      {String? label = '', String? placeholder = '', IconData? iconData}) {
    return InputDecoration(
      hintText: placeholder,
      labelText: label,
      labelStyle: TextStyle(
        color: ibmGray['80'],
      ),
      prefixIcon: iconData != null
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(iconData),
            )
          : null,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: drtGreen, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ibmGray['50']!, width: 2.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ibmGray['20']!, width: 2.0),
      ),
    );
  }

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
        hintText: widget.placeholder,
        labelStyle: TextStyle(
          color: ibmGray['80'],
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: drtGreen, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ibmGray['50']!, width: 2.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ibmGray['20']!, width: 2.0),
        ),
      ),
    );
  }
}
