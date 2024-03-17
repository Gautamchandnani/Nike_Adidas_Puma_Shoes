// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';
import 'package:blckdrop/utils/utils.dart';

class SearchWidget extends StatefulWidget {
  TextEditingController controllerSearch = TextEditingController();
  final IconData icon;
  final String? hintText;
  SearchWidget(
      {super.key,
      required this.controllerSearch,
      required this.hintText,
      required this.icon});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: widget.controllerSearch,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Constants.featuresColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          hintText: widget.hintText,
          fillColor: Colors.grey[300],
          filled: true,
        ),
      ),
    );
  }
}
