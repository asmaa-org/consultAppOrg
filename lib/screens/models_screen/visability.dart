import 'package:flutter/material.dart';

class VisabiltyCard extends StatefulWidget {
  bool isClicked;
  String text;
  Widget child;

  VisabiltyCard(
      {Key? key,
      required this.isClicked,
      required this.child,
      required this.text})
      : super(key: key);

  @override
  State<VisabiltyCard> createState() => _VisabiltyCardState();
}

class _VisabiltyCardState extends State<VisabiltyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            IconButton(
                onPressed: () {
                  //todo:using provider

                  widget.isClicked = !widget.isClicked;
                  setState(() {
                    print(widget.isClicked);
                  });
                },
                icon: widget.isClicked == true
                    ? Icon(Icons.arrow_drop_up_outlined)
                    : Icon(Icons.arrow_drop_down_outlined)),
          ],
        ),
        Visibility(
          visible: !widget.isClicked,
          child: widget.child,
        ),
      ],
    );
  }
}
