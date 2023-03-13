import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/Tag.dart';

class ListOfTags extends StatelessWidget {
  final String label;

  const ListOfTags({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

Widget Tagleb({required String label}) {
  return Chip(
    label: Text(label),
    backgroundColor: Colors.grey.shade300,
  );
}
