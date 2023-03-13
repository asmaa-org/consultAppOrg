import 'package:consultApp/screens/details_screen.dart';
import 'package:consultApp/services/user_services.dart';
import 'package:flutter/material.dart';

import '../models/Category.dart';
import '../models/Mail.dart';
import '../services/category_services.dart';
import '../services/mail_services.dart';
import '../services/search_services.dart';
import 'category_screen.dart';
import 'login_screen.dart';
import 'models_screen/org_card.dart';
import 'models_screen/organization.dart';
import 'models_screen/search_field.dart';
import 'models_screen/status_card.dart';
import 'models_screen/tags.dart';
import 'models_screen/visability.dart';
import 'my_mails.dart';
import 'newinbox_screen.dart';
import 'search_filters_screen.dart';
import 'status_screen.dart';

class MyHomeScreen extends StatefulWidget {
  MyHomeScreen({Key? key}) : super(key: key);

  static const id = 'HomeScreen';

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool officalOrgIsClicked = false;
  bool OthersIsClicked = false;

  bool isClicked = false;

  SearchServices searchServices = SearchServices();
  List<Mail> mails = [];
  List<Mail> serachMails = [];
  List<Category> categories = [];

  Future<List<Mail>> getMails(int id) async {
    MailServices mailServices = MailServices();
    var apiResponse = await mailServices.getMail(id);
    if (apiResponse.error == null) {
      mails = apiResponse.data as List<Mail>;
      print(mails);
    }
    return mails;
  }

  void getCategories() async {
    CategoryServices cs = CategoryServices();
    var apiResponse = await cs.getAllCategories();
    if (apiResponse.error == null) {
      categories = apiResponse.data as List<Category>;
      print(categories);
    }
  }

  Widget showMails(int id) {
    List<Mail> myMails = getMails(id) as List<Mail>;
    if (myMails.isNotEmpty) {
      return Column(
        children: [
          for (var mail in myMails) ...{
            OrgCard(
              org: Organization(
                description: mail.description!,
                orgName: mail.sender!.name!,
                subject: mail.subject!,
                status: mail.status!.name!,
              ),
            ),
          }
        ],
      );
    } else {
      return SizedBox();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f6ff),
      drawer: Drawer(
        backgroundColor: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/logo.png')),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyHomeScreen.id);
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NewInboxScreen.id);
                  },
                  child: Text(
                    'Inbox',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CategoryScreen.id);
                  },
                  child: Text(
                    'Category',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailsScreen.id);
                  },
                  child: Text(
                    'Details',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, StatusScreen.id);
                  },
                  child: Text(
                    'Status',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchFilter.id);
                  },
                  child: Text(
                    'Filters',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        backgroundColor: Color(0xfff3f6ff),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 20,
              child: IconButton(
                onPressed: () {
                  UserServices().logoutUser();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.id, (route) => false);
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ), //todo:add user image
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchField(
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: colorMap.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0,
                            childAspectRatio: 170 / 100),
                        itemBuilder: (BuildContext context, int index) =>
                            StatusCard(
                          circleColor: values[index],
                          taskNum: '9',
                          status: keys[index],
                        ),
                      ),
                    ),
                    mails.isNotEmpty
                        ? MyMails(
                      mails: mails,
                    )
                        : SizedBox(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Tags",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      height: 150,
                      width: double.infinity,
                      //child: ListOfTags(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.all(16),
                  color: Colors.white,
                  height: 80,
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, NewInboxScreen.id);
                          },
                          icon: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blueAccent,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'New Inbox',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blueAccent),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
