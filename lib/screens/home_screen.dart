import 'package:flutter/material.dart';
import '../models/org_card.dart';
import '../models/organization.dart';
import '../models/search_field.dart';
import '../models/status_card.dart';
import '../models/tags.dart';
import '../models/visability.dart';

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({Key? key}) : super(key: key);

  bool officalOrgIsClicked = false;

  bool OthersIsClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE0EAF9),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {}, //todo:drawr
                            icon: Icon(Icons.menu),
                          ),
                          CircleAvatar(
                              radius: 25,
                              child: Image.asset('') //todo:add user image
                              ),
                        ]),
                    SearchField(
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: StatusListGrid(),
                    ),
                    VisabiltyCard(
                      isClicked: officalOrgIsClicked,
                      text: 'Oficial Organization',
                      child: OrgCard(
                        org: Organization(
                          description:
                              'here we add the description of the subject',
                          orgName: 'Orgnization Name',
                          subject: 'here we add subject',
                          status: 'Inbox',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "NGOs",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              //todo:navegate to NGOs screen
                            },
                            icon: Icon(Icons.arrow_right)),
                      ],
                    ),
                    VisabiltyCard(
                      isClicked: OthersIsClicked,
                      text: 'Others',
                      child: OrgCard(
                        org: Organization(
                          description:
                              'here we add the description of the subject',
                          orgName: 'Orgnization Name',
                          subject: 'here we add subject',
                          status: 'Pending',
                        ),
                      ),
                    ),
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
                      child: ListOfTags(),
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
                  height: 70,
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          child: Icon(Icons.add),
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

class StatusListGrid extends StatelessWidget {
  const StatusListGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: colorMap.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          childAspectRatio: 170 / 100),
      itemBuilder: (BuildContext context, int index) => StatusCard(
        circleColor: values[index],
        taskNum: '9',
        status: keys[index],
      ),
    );
  }
}
