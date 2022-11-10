import 'package:flutter/material.dart';
import 'package:transit_app/pages/updates/news_list.dart';
import 'package:transit_app/widgets/screen_title.dart';
import 'package:transit_app/colors.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        constraints: const BoxConstraints.expand(),
        color: ibmGray['10'],
        padding: const EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32.0),
            const ScreenTitle(title: 'Updates'),
            const SizedBox(height: 16.0),
            const NewsList(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
