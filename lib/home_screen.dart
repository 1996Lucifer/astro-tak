import 'package:astro_talks/astro_screen/astro_main.dart';
import 'package:astro_talks/shared_widget/custom_scaffold.dart';
import 'package:astro_talks/utils/constants.dart';
import 'package:astro_talks/utils/images.dart';
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    AstroScreen(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.grey[400]),
              label: 'Home',
              activeIcon: Utils.assetImage(url: Images.home)),
          BottomNavigationBarItem(
              icon: Utils.assetImage(url: Images.talkToAstrologer),
              label: 'Talk To Astrologer',
              activeIcon:
                  Icon(Icons.question_answer, color: Constants.primaryColor)),
          BottomNavigationBarItem(
              icon: Utils.assetImage(url: Images.ask),
              label: 'Ask Question',
              activeIcon: Icon(Icons.chat, color: Constants.primaryColor)),
          BottomNavigationBarItem(
              icon: Utils.assetImage(url: Images.reports),
              label: 'Reports',
              activeIcon: Icon(Icons.note_alt, color: Constants.primaryColor)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Constants.primaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
