import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class  ListOfTags extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.all(16),
      child: Wrap(
          spacing: 8.0, // space between tags
          runSpacing: 4.0, // space between rows of tags
          children: <Widget>[
            Tag(
              label:'All Tag ',
            ),
            Tag(
              label:  '#Urgent',

            ),
            Tag(
              label:'#Egyption Military',

            ),
            Tag(label:'#New'),
          ]
      ),
    );
  }}

Widget Tag ({required  String label}){
  return   Chip(
    label: Text(label),
    backgroundColor: Colors.grey.shade300,
  );
}