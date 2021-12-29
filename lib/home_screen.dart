import 'package:astro_talks/astro_screen/astro_bloc/bloc.dart';
import 'package:astro_talks/astro_screen/astro_bloc/state.dart';
import 'package:astro_talks/astro_screen/astro_main.dart';
import 'package:astro_talks/daily_panchang/panchang.dart';
import 'package:astro_talks/shared_widget/appbar.dart';
import 'package:astro_talks/shared_widget/custom_scaffold.dart';
import 'package:astro_talks/utils/colors.dart';
import 'package:astro_talks/utils/images.dart';
import 'package:astro_talks/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  PageController _pageController;
  AstroBloc _astroBloc;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
    _astroBloc = AstroBloc(AstroInitialState());
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      _selectedIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: PageView(
        children: <Widget>[
          BlocProvider<AstroBloc>(
            create: (context) => _astroBloc,
            child: AstroScreen(),
          ),
          DailyPanchang(),
          Text(
            'Ask Questions',
            style: optionStyle,
          ),
          Text(
            'Reports',
            style: optionStyle,
          ),
        ],
        controller: _pageController,
        onPageChanged: onPageChanged,
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
                  Icon(Icons.question_answer, color: ColorShades.primaryColor)),
          BottomNavigationBarItem(
              icon: Utils.assetImage(url: Images.ask),
              label: 'Ask Question',
              activeIcon: Icon(Icons.chat, color: ColorShades.primaryColor)),
          BottomNavigationBarItem(
              icon: Utils.assetImage(url: Images.reports),
              label: 'Reports',
              activeIcon:
                  Icon(Icons.note_alt, color: ColorShades.primaryColor)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ColorShades.primaryColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
