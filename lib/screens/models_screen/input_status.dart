import 'package:flutter/material.dart';

import '../../utills/constants.dart';

class InputStatus extends StatefulWidget {
  const InputStatus({Key? key}) : super(key: key);

  @override
  State<InputStatus> createState() => _InputStatusState();
}

class _InputStatusState extends State<InputStatus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text(
                'Add Status',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.edit_outlined),
              color: Colors.grey,
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'Inbox',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ]),
        Divider(),
        SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                'Pending',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Icon(
            Icons.check,
            color: Colors.blueAccent,
          ),
        ]),
        Divider(),
        SizedBox(height: 15),
        Row(children: [
          Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'In Progress',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ]),
        Divider(),
        SizedBox(height: 15),
        Row(children: [
          Container(
            height: 32,
            width: 32,
            decoration: colorBoxDecoration.copyWith(color: Colors.green),
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            'Completed',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ]),
      ]),
    );
  }
}
