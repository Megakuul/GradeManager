import 'package:flutter/material.dart';
import 'package:grademanagerv2/ext.dart';

class semester extends StatefulWidget {
  @override
  State<semester> createState() {
    return _semesterState();
  }
}

class _semesterState extends State<semester> {
  @override
  Widget build(BuildContext context) {
    return ScrollContainer(
      context: context,
      child: Text("Hallo"),
    );
  }
}