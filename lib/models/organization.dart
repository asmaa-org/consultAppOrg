import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Organization{
  late String orgName;
  late String description;
  late String subject;
  late DateTime now;
  late String time;

  late String status;
  Organization({required this.description,
    required this.orgName,required this.status,required this.subject}){
    now = DateTime.now();
    time = DateFormat('yyyy-MM-dd HH').format(now);
  }
}

Map<String, Color> colorMap = {
  'Inbox': Colors.red,
  'Completed': Colors.green,
  'InProgress': Colors.blue,
  'Pending':Colors.yellow,
};
List keys= colorMap.keys.toList();
List values=colorMap.values.toList();