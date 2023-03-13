import 'package:consultApp/apis/ApiResponse.dart';
import 'package:consultApp/models/Sender.dart';
import 'package:consultApp/services/mail_services.dart';
import 'package:consultApp/services/sender_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/Mail.dart';
import 'category_screen.dart';
import 'home_screen.dart';
import 'models_screen/date_picker.dart';
import 'sender_screen.dart';
import 'status_screen.dart';
import 'tags_screen.dart';
import 'package:intl/intl.dart';

class NewInboxScreen extends StatefulWidget {
  NewInboxScreen({Key? key}) : super(key: key);

  static const id = 'NewInboxScreen';

  @override
  State<NewInboxScreen> createState() => _NewInboxScreenState();
}

class _NewInboxScreenState extends State<NewInboxScreen> {
  TextEditingController controller = TextEditingController();

  TextEditingController senderController = TextEditingController();

  TextEditingController titlemailController = TextEditingController();

  TextEditingController describtionController = TextEditingController();

  TextEditingController desicionController = TextEditingController();
  DateTime mydate = DateTime.now();
  MailServices mailServices = MailServices();
  Mail mail = Mail();
  SenderServices senderServices = SenderServices();
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
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 18, color: Color(0xff6589FF)),
              ),
            ),
            Text(
              'New Inbox',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            TextButton(
              onPressed: () async {
                print('object');
                 ApiResponse apiRes = await senderServices.createSender(Sender(name: senderController.text,categoryId: 1,),);
                 if(apiRes.error ==null){
                   Sender newSender = apiRes.data as Sender;
                   print(newSender.name);
                   // mail.description = describtionController.text;
                   // mail.decision = desicionController.text;
                   // mail.archiveDate = mydate;
                   // mail.senderId = newSender.id;
                   //
                   // var apiResponse = await mailServices.createMail(mail);
                   // print(apiResponse.data);
                   // print(apiResponse.error);
                   // if (apiResponse.error == null) {
                   //   mail = apiResponse.data as Mail;
                   //   Navigator.pushNamedAndRemoveUntil(
                   //       context, MyHomeScreen.id, (r) => false);
                   // }
                 }


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
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.person_outline,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: TextField(
                              controller: senderController,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Sender',
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color(0XFFAFAFAF),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SenderScreen.id);
                              },
                              icon: Icon(Icons.info_outline,
                                  color: Color(0xff6589FF))),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Divider(
                          height: 10,
                          color: Color(0XFFD0D0D0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, CategoryScreen.id);
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Other',
                                    style: TextStyle(
                                      color: Color(0XFF707070),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                    color: Color(0XFF707070),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: titlemailController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Title of Mail',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0XFFAFAFAF),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Divider(
                          height: 40,
                          color: Color(0XFFD0D0D0),
                        ),
                      ),
                      TextField(
                        controller: describtionController,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Describtion',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0XFFAFAFAF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyDatePicker(
                          onDateSelected: (DateTime date) {
                            setState(() {
                              mydate = date;
                            });
                          },
                        ),
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
                            Text(
                              '${DateFormat('EEEE, MMMM d, yyyy').format(mydate)}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff6589FF),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Divider(
                        height: 30,
                        color: Color(0xffD0D0D0),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.file_present,
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Archive Number',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '2022/6019',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '#',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Tags',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, TagsScreen.id);
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
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
                            width: 10,
                          ),
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Inbox',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, StatusScreen.id);
                        },
                        icon: Icon(Icons.arrow_forward_ios),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Decision',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Divider(
                          height: 20,
                          color: Color(0XFFD0D0D0),
                        ),
                      ),
                      TextField(
                        controller: desicionController,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Add New Decision...',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          TextButton(
                            child: Text(
                              'Add Image',
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 15),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Activity',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down_outlined),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
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
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
