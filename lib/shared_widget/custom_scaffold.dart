import 'package:astro_talks/shared_widget/appbar.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget child;
  final BottomNavigationBar bottomNavigationBar;
  
  const CustomScaffold({
    Key? key,
    required this.child,
    required this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
