import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:transit_app/Map/StopDetail/StopDetailWidget.dart';
import 'dart:io';

class homeWidget extends StatefulWidget {
  const homeWidget({Key? key}) : super(key: key);

  @override
  State<homeWidget> createState() => _homeWidgetState();
}

class _homeWidgetState extends State<homeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Change Container to map later
        Container(
          color: Colors.red,
        ),

        Positioned(
          top: 10,
          right: 15,
          left: 15,
          child: Container(
            color: Colors.white,
            child: Row(
              children: const <Widget>[
                Expanded(
                  child: CupertinoSearchTextField(
                    placeholder: 'Search Address',
                  ),
                ),
              ],
            ),
          ),
        ),

        Center(
          child: ElevatedButton(
            child: Text("Bus Stop",
              style: TextStyle(fontSize: 30),
            ),
            onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const stopDetailWidget())
              );
            },
          ),
        )
      ],
    );
  }
}
