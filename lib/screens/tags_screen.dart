import 'package:consultApp/screens/newinbox_screen.dart';
import 'package:flutter/material.dart';

import '../services/tag_services.dart';
import 'models_screen/tags.dart';

class TagsScreen extends StatefulWidget {
  const TagsScreen({Key? key}) : super(key: key);
  static const id = 'TagsScreen';
  @override
  State<TagsScreen> createState() => _TagsScreenState();
}

class _TagsScreenState extends State<TagsScreen> {
  List tags = [];
  TagServices tagServices = TagServices();
 late TextEditingController controller ;
 @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
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
                'Tags',
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    height: 150,
                    width: double.infinity,
                    child: ListOfTags(
                      label: controller.text,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    height: 50,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add New Tags ...',
                        ),
                        onTap: (){
                          tagServices.createTag(controller.text).then((value) {
                            controller.clear();
                            setState(() {
                            });

                          });
                        },

                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
