import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import 'models_screen/org_card.dart';
import 'models_screen/organization.dart';

class MyMails extends StatelessWidget {
  final List<dynamic> mails;
  const MyMails({Key? key, required this.mails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(mails[1]);
    return GroupedListView<dynamic, String>(
      shrinkWrap: true,
      elements: mails,
      groupBy: (element) => element['sender']['category']['name'],
      groupSeparatorBuilder: (String groupByValue) => Text(groupByValue,style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,

      ),),
      itemBuilder: (context, dynamic element) {
        // Text(element['sender']['name'])
        return OrgCard(
          org: Organization(
            description: '${element['description']}',
            orgName: element['sender']['name'],
            subject: element['subject'],
            status: element['status']['name'],
          ),
        );
      },
      // itemComparator: (item1, item2) =>
      //     item1['name'].compareTo(item2['name']), // optional
      useStickyGroupSeparators: true, // optional
      floatingHeader: true, // optional
      order: GroupedListOrder.ASC, // optional
    );
  }
}

