import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/widgets/drt_elevated_button.dart';
import 'package:transit_app/widgets/text_input.dart';

import 'stops/stop_detail_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 250.0,
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      panel: Container(
        color: ibmGray['10'],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Container(
                    height: 3.0,
                    width: 30.0,
                    color: ibmGray['80'],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const TextInput(
                label: 'Starting Point',
                placeholder: 'Enter address',
              ),
              const SizedBox(height: 16.0),
              const TextInput(
                label: 'Destination',
                placeholder: 'Enter address',
              ),
              const SizedBox(height: 16.0),
              DRTElevatedButton(
                text: 'Search',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Bus Stop",
            style: TextStyle(fontSize: 30),
          ),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const StopDetailWidget())
            );
          },
        ),
      ),
    );
  }
}
