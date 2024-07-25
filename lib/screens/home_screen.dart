//stateful widget called home screene
//list of the screens is here, we had to insert where the button should redirect user (FINAL SCREENS below)
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/screens/forecast_screen.dart';
import 'package:weather_app_tutorial/screens/search_screen.dart';
import 'package:weather_app_tutorial/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  //equal to navigation destinations, each of it holding an icon and label
  //we needed to add the color white to make it visible on dark theme
  final _destinations = const [
    NavigationDestination(
        icon: Icon(Icons.home_outlined, color: Colors.white),
        selectedIcon: Icon(Icons.home,color: Colors.white),
        label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.search_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.search, color: Colors.white),
      label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.wb_sunny_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.wb_sunny, color: Colors.white),
      label: '',
    ),
    NavigationDestination(
      icon: Icon(Icons.settings_outlined, color: Colors.white),
      selectedIcon: Icon(Icons.settings, color: Colors.white),
      label: '',
    ),
  ];

  final _screens = [
    const WeatherScreen(),
    const SearchScreen(),
    const ForecastScreen(),
    const Center(child: Text('Settings Screen')),
  ];

  //tittle section
  @override
  Widget build(BuildContext context){
    return Scaffold(
      //let's specify our body (list of screens, displayed according to the index)
      body: _screens [_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: AppColors.secondaryBlack,
        ),
        child: NavigationBar(
        destinations: _destinations,
          //our bottom nav bar items are centered
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _currentPageIndex,
        //we don't have any indicator color
        indicatorColor: Colors.transparent,
        //when we choose the bottom (destination selected) pls mark it black:
        onDestinationSelected: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        ),
      ),
      );
    }
  }