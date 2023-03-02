import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final Function(String) onChanged;

  const SearchField({super.key, required this.onChanged});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    widget.onChanged(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          color:Colors.white,
          borderRadius:BorderRadius.circular(25.0)
      ),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              widget.onChanged('');
            },
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(25.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),

      ),
    );
  }
}