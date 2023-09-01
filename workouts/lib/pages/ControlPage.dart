import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:workouts/pages/Calender.dart';
import 'package:workouts/pages/Home.dart';

import '../ui/colorshema.dart';
import 'Time.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  int _currentIndex = 0;
  late PageController _pageController;

  ColorSheme get _colorshemes => ColorSheme.instance;

  @override
  void initState() {
    
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
 
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          index: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
            _pageController.jumpToPage(value);
          },
          backgroundColor: _colorshemes.siyah,
          color: _colorshemes.background,
          items: const [
            Icon(Icons.home),
            Icon(Icons.timer),
            Icon(Icons.calendar_month)
          ]),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        controller: _pageController,
        children: const <Widget>[HomePage(), Time(), TableCalender()],
      ),
    );
  }
}
