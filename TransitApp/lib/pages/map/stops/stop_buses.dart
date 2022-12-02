import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/colors.dart';
import 'package:transit_app/local_storage/schedule.dart';
import 'package:transit_app/local_storage/schedule_model.dart';
import 'package:transit_app/pages/scheduled/scheduled_form.dart';
import 'package:transit_app/widgets/screen_title.dart';
import 'package:transit_app/local_storage/db_utils.dart';

class StopBuses extends StatefulWidget {
  StopBuses({super.key});

  @override
  State<StopBuses> createState() => _StopBusesState();
}

class _StopBusesState extends State<StopBuses> {
  @override
  void initState() {
    super.initState();

  }

  Future _loadTripData() async{

  }

  Future _loadStopTimeData() async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          color: ibmGray['10'],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: drtGreen,
                      ),
                    ),
                    const ScreenTitle(title: 'Buses'),
                  ],
                ),
                const SizedBox(height: 32.0),
                // ListView.builder(
                //     itemBuilder: (BuildContext context, int index){
                //       return ListTile(
                //         title: Text("List item $index"),
                //         onTap: (){
                //
                //         },
                //       );
                //     }
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
