import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function(int, String) callback;

  const SearchBox({super.key, required this.callback});

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: TextField(
        onChanged: (value) => widget.callback(-1,value),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(width: 0.1, color: Colors.white),
          ),
          hintText: 'Search here',
          prefixIcon: const Icon(
            Icons.search,
            size: 30.0,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
