import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  final String hint;
  final Function(String) onChanged;

  SearchView({@required this.hint, @required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: Container(
        color: Colors.white.withOpacity(0.2),
        child: TextField(
            decoration: new InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hint,
            ),
            onChanged: (text) {
              onChanged(text);
            }),
      ),
    );
  }
}
