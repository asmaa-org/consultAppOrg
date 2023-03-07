import 'package:flutter/material.dart';
import 'organization.dart';

class OrgCard extends StatelessWidget {
  const OrgCard({Key? key, required this.org}) : super(key: key);
  final Organization org;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: colorMap[org.status],
                ),
                Text(
                  org.orgName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                Text(org.time.toString()),
                IconButton(
                    onPressed: () {
                      //todo:naviagate to massg detile
                    },
                    icon: Icon(Icons.navigate_next)),
              ],
            ),
          ),
          Text(
            org.subject,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Text(
            org.description,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.blueAccent,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
