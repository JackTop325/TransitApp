import 'package:flutter/material.dart';
import 'package:transit_app/widgets/text_input.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            TextInput(),
            const SizedBox(
              height: 20.0,
            ),
            TextInput(),
          ]),
        ),
      ),
    );
  }
}
