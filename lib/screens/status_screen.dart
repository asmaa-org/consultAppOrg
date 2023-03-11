import 'package:consultApp/screens/details_screen.dart';
import 'package:flutter/material.dart';

import 'models_screen/input_status.dart';
import 'newinbox_screen.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);
  static const id = 'StatusScreen';
  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0EAF9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffE0EAF9),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, DetailsScreen.id, (r) => false);
              },
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 18, color: Color(0xff6589FF)),
              ),
            ),
            Text(
              'Status',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, NewInboxScreen.id, (r) => false);
              },
              child: Text(
                'Done',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6589FF)),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: InputStatus(),
            ),
          ),
        ]),
      ),
    );
  }
}
