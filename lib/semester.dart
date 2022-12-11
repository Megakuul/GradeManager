import 'dart:convert';
import 'dart:ffi';


import 'package:flutter/material.dart';
import 'package:grademanagerv2/ext.dart';
import 'dart:collection';

import 'main.dart';

class semester extends StatefulWidget {


  @override
  State<semester> createState() {
    return _semesterState();
  }
}

class _semesterState extends State<semester> {

  var semesterList = <Widget>[];

  void rewrapList() {
    setState(() {
      semesterList.clear();

      if (config!.isEmpty) {
        semesterList.add(semesterContainer("No semesters initialized", 0));
      }
      else {
        config!.forEach((key, value) {
          semesterList.add(semesterContainer(key, 0));
        });
      }
    });
  }

  Container semesterContainer(String semester, int averageGrade) {
    return Container(
      height: 50,
      color: Colors.amber[600],
      child: Center(child: Text(semester)),
    );
  }

  @override
  void initState() {
    super.initState();
    rewrapList();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollContainer(
      context: context,
      child: Container(
        height: 300,
        child: ListView(
          prototypeItem: Text("Halloo"),
          padding: const EdgeInsets.all(8),
          children: semesterList,
        ),
      )
    );
  }
}