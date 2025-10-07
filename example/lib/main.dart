import 'package:flutter/material.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

void main() => runApp(const MyApp());

///
class MyApp extends StatefulWidget {
  ///
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withValues(alpha: .25),
                offset: const Offset(0, 5),
                blurRadius: 4,
                spreadRadius: .01,
              ),
            ],
          ),
          child: ResponsiveNavigationBar(
            outerPadding: EdgeInsets.zero,
            backgroundGradient: const LinearGradient(
              colors: [Colors.blue, Colors.blue],
            ),
            backgroundBlur: 0.0,
            animationDuration: const Duration(milliseconds: 200),
            activeIconColor: Colors.blue,
            inactiveIconColor: Colors.white,
            backgroundColor: Colors.white,
            fontSize: 17,
            tabHeight: 50,
            // outerPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            activeButtonFlexFactor: 120,
            inactiveButtonsFlexFactor: 100,
            onTabChange: changeTab,
            selectedIndex: _selectedIndex,
            // showActiveButtonText: false,
            textStyle: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            navigationBarButtons: <NavigationBarButton>[
              const NavigationBarButton(
                  text: 'Tab 1',
                  icon: Icons.people,
                  backgroundColor: Colors.white),
              NavigationBarButton(
                  text: 'Tab 2',
                  iconWidget: CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        _selectedIndex == 1 ? Colors.white : Colors.blueAccent,
                    child: const Icon(size: 40, Icons.settings),
                  ),
                  // tabHeight: 40,
                  backgroundColor: Colors.white),
              const NavigationBarButton(
                  text: 'Tab 3',
                  icon: Icons.settings,
                  iconSize: 40,
                  backgroundColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
