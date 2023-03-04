import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_screen.dart';

class SenderScreen extends StatelessWidget {
  SenderScreen({Key? key}) : super(key: key);
  static const id = "SenderSearchScreen";
  TextEditingController controller = TextEditingController();
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
                    context, MyHomeScreen.id, (r) => false);
              },
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 18, color: Color(0xff6589FF)),
              ),
            ),
            Text(
              'Sender',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyHomeScreen.id, (r) => false);
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white70,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
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
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Sport',
                ),
              ),
            ),
            const divider(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: const [
                  Text('"Sport"'),
                ],
              ),
            ),
            const divider(),
            const AllSenders(
              title: 'Official ORG',
            ),
            const AllSenders(
              title: 'Other',
            ),
          ],
        ),
      ),
    );
  }
}

class AllSenders extends StatelessWidget {
  const AllSenders({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color(0XFFAFAFAF),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
        ),
        const divider(),
        const Sender(),
        const Sender(),
      ],
    );
  }
}

class Sender extends StatelessWidget {
  const Sender({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [Icon(Icons.person), Text('Sender 1')],
        ),
        const divider(),
      ],
    );
  }
}

class divider extends StatelessWidget {
  const divider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Divider(
          height: 20,
          color: Color(0XFFD0D0D0),
        ),
      ],
    );
  }
}
