import 'package:flutter/material.dart';

import 'newinbox_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const id = 'CategoryScreen';
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      context, NewInboxScreen.id, (r) => false);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 18, color: Color(0xff6589FF)),
                ),
              ),
              Text(
                'Category',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFEAEAF5),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  22,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(shrinkWrap: true, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Official organization',
                      ),
                      Icon(
                        Icons.check,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('NGOs'),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('UnBorder'),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Others')
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
