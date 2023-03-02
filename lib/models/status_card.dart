import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  const StatusCard(
      {Key? key,
      required this.circleColor,
      required this.taskNum,
      required this.status})
      : super(key: key);
  final Color circleColor;
  final String taskNum;
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 5,
              backgroundColor: circleColor,
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                status,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
