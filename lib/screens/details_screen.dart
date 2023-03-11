import 'package:consultApp/screens/status_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class DetailsScreen extends StatelessWidget {
  bool officalOrgIsClicked = false;
  static const id = 'DetailsScreen';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0EAF9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffE0EAF9),
        title: Text(
          "Home",
          style: TextStyle(
            color: Color(0xff6589FF),
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, MyHomeScreen.id, (r) => false);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff6589FF),
          ),
        ),
        actions: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.more_horiz,
                color: Color(0xff6589FF),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Container(
                height: 220,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.person_outline_outlined,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Sport Ministry',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Official organization',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xffB2B2B2)),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              Text(
                                'Today, 11:00 AM',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xffB2B2B2),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Arch 2022/1032',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xffB2B2B2)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Divider(
                        height: 10,
                        color: Color(0xffD0D0D0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Title of mail',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    backgroundColor: Color(0xffE0EAF9),
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                    )),
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Container(
                                          height: 200,
                                          color: Color(0xffE0EAF9),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Title of Mail',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor:
                                                          Colors.grey,
                                                      child: const Icon(
                                                        Icons.clear,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    MoreImg(
                                                      icon: Icon(
                                                        Icons.archive,
                                                        color:
                                                            Color(0xff7C7C7C),
                                                      ),
                                                      name: 'Archive',
                                                      color: Color(0xff7C7C7C),
                                                    ),
                                                    MoreImg(
                                                      icon: Icon(
                                                        FontAwesomeIcons
                                                            .shareFromSquare,
                                                        color:
                                                            Color(0xff6589FF),
                                                      ),
                                                      name: 'Share',
                                                      color: Color(0xff6589FF),
                                                    ),
                                                    MoreImg(
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color:
                                                            Color(0xffE62929),
                                                      ),
                                                      name: 'Delete',
                                                      color: Color(0xffE62929),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 114,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing"
                              " and type setting industry. Lorem Ipsum has been the industry’s standard"
                              " dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Why do we use it It is a long established fact that a reader will be distra",
                              overflow: TextOverflow.clip,
                              maxLines: 5,
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff898989)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 56,
                width: 378,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '#',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff707070)),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            '#Urgent ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff959595)),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            '#Egyptian Military ',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff959595)),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 56,
                width: 378,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.tags,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Chip(
                            label: Text(
                              'Pending',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                            backgroundColor: Colors.yellow,
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, StatusScreen.id);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 378,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Decision',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add New Decision',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 220,
                width: 378,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        child: Text(
                          'Add Image',
                          style:
                              TextStyle(color: Colors.blueAccent, fontSize: 15),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AddImg(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          color: Color(0xffD0D0D0),
                        ),
                      ),
                      AddImg(),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Activity',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_drop_down_outlined),
                ],
              ),
              Activity(
                name: 'Hossam',
              ),
              Activity(
                name: 'Ali',
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: false,
                  fillColor: Color(0xffEEEEF6),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/person.jpg',
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.send,
                    color: Color(0xff6589FF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  labelText: 'Add new Activity …',
                ),
              ),
              SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddImg extends StatelessWidget {
  const AddImg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xffFF2E2E),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
              radius: 15,
            ),
            SizedBox(
              width: 15,
            ),
            ImgIcons(),
            SizedBox(
              width: 15,
            ),
            Text(
              'Image',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        Icon(
          Icons.menu,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class ImgIcons extends StatelessWidget {
  const ImgIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/person.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 378,
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/person.jpg',
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Today, 11:00 AM",
                      style: TextStyle(fontSize: 12, color: Color(0xffB2B2B2)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: const [
                Text(
                  'The issue transferred to AAAA',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff898989),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MoreImg extends StatelessWidget {
  const MoreImg({
    Key? key,
    required this.icon,
    required this.name,
    required this.color,
  }) : super(key: key);
  final Icon icon;
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: icon,
            iconSize: 40,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 16, color: color),
          )
        ],
      ),
    );
  }
}
