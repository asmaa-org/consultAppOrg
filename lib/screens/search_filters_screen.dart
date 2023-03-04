import 'package:flutter/material.dart';
import '../models/constants.dart';
import '../models/date_picker.dart';
import 'newinbox_screen.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({Key? key}) : super(key: key);
  static const id = 'SearchFiltersScreen';
  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
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
                  'Filters',
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
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
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        MyDatePicker(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'From:  ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Text(
                                      'July 5, 2022',
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xff6589FF)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'To:  ',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    Text(
                                      'July 5, 2022',
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xff6589FF)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
