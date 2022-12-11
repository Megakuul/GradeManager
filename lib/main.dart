//import 'dart:html';
import 'dart:ffi';
import 'package:flutter/services.dart';
import 'dart:convert';

import './home.dart';
import './semester.dart';
import './settings.dart';

import 'package:flutter/material.dart';

Map? config;

void fetchConfig() async {
  var configFile = await rootBundle.loadString("assets/config.gm");
  config = const JsonDecoder().convert(configFile);
}

void main() {
  runApp(const MyApp());
}

//MainWidget//----------------------------------------|
//MainWidget//----------------------------------------|
//MainWidget//----------------------------------------|

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GradeManager',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MainPage(title: 'GradeManager'),
    );
  }
}

//MainWidget//----------------------------------------|
//MainWidget//----------------------------------------|
//MainWidget//----------------------------------------|


class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPage();
}


class _MainPage extends State<MainPage> {

  final Map<int, Widget> _Pages = {
    0: home(),
    1: semester(),
    2: settings()
  };

  int _selectedBNBItem = 0;

  void _changeBNBItem(int index) {
    setState(() {
      _selectedBNBItem = index;
    });
  }

  @override void initState() {
    // TODO: implement initState
    super.initState();
    fetchConfig();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        enableFeedback: true,
        selectedItemColor: const Color.fromARGB(255, 20, 30, 48),
        currentIndex: _selectedBNBItem,
        onTap: _changeBNBItem,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart_rounded),
            label: 'Semester'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings'
          )
        ],
      ),
      body: _Pages[_selectedBNBItem]
    );
  }
}
