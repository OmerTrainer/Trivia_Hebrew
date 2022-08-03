import 'dart:developer';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:game/screens/help_page.dart';
import 'package:game/screens/home_page.dart';
import 'package:game/screens/profile_page.dart';
import 'package:game/screens/settings_page.dart';
import 'package:game/utils/device_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const BottomNavigatorExample(title: 'מלך הטריוויה'),
        '/home': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'מלך הטירוויה',
    );
  }
}

class BottomNavigatorExample extends StatefulWidget {
  const BottomNavigatorExample({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<BottomNavigatorExample> createState() => _BottomNavigatorExampleState();
}

class _BottomNavigatorExampleState extends State<BottomNavigatorExample> {
  bool circleButtonToggle = false;
  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    TutorialScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            floatingActionButton: SizedBox(
              height: DeviceUtils.getScaledHeight(context, 0.05),
              width: DeviceUtils.getScaledWidth(context, 0.05),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              bottomBarItems: [
                BottomBarItemsModel(
                  icon: Icon(Icons.home,
                      size: DeviceUtils.getScaledHeight(context, 0.05)),
                  iconSelected: Icon(Icons.home,
                      color: AppColors.cherryRed,
                      size: DeviceUtils.getScaledHeight(context, 0.05)),
                  title: 'בית',
                  dotColor: AppColors.cherryRed,
                  onTap: () {
                    log('Home');
                  },
                ),
                BottomBarItemsModel(
                  icon: Icon(Icons.search,
                      size: DeviceUtils.getScaledHeight(context, 0.05)),
                  iconSelected: Icon(Icons.search,
                      color: AppColors.cherryRed,
                      size: DeviceUtils.getScaledHeight(context, 0.05)),
                  title: 'עזרה',
                  dotColor: AppColors.cherryRed,
                  onTap: () {
                    log('Search');
                    setState(() {
                      currentIndex = 1;
                    });
                  },
                ),
                BottomBarItemsModel(
                    icon: Icon(Icons.settings,
                        size: DeviceUtils.getScaledHeight(context, 0.05)),
                    iconSelected: Icon(Icons.settings,
                        color: AppColors.cherryRed,
                        size: DeviceUtils.getScaledHeight(context, 0.05)),
                    title: 'הגדרות',
                    dotColor: AppColors.cherryRed,
                    onTap: () {
                      log('Settings');
                      setState(() {
                        currentIndex = 2;
                      });
                    }),
                BottomBarItemsModel(
                  icon: Icon(Icons.person,
                      size: DeviceUtils.getScaledHeight(context, 0.05)),
                  iconSelected: Icon(Icons.person,
                      color: AppColors.cherryRed,
                      size: DeviceUtils.getScaledHeight(context, 0.05)),
                  title: 'פרופיל',
                  dotColor: AppColors.cherryRed,
                  onTap: () {
                    log('Profile');
                    setState(() {
                      currentIndex = 3;
                    });
                  },
                ),
              ],
              bottomBarCenterModel: BottomBarCenterModel(
                centerBackgroundColor: AppColors.cherryRed,
                centerIcon: const FloatingCenterButton(
                  child: Icon(
                    Icons.add,
                    color: AppColors.white,
                  ),
                ),
                centerIconChild: [
                  FloatingCenterButtonChild(
                    child: const Icon(
                      Icons.home,
                      color: AppColors.white,
                    ),
                    onTap: () => log('Item1'),
                  ),
                  FloatingCenterButtonChild(
                    child: const Icon(
                      Icons.home,
                      color: AppColors.white,
                    ),
                    onTap: () => log('Item2'),
                  ),
                  FloatingCenterButtonChild(
                    child: const Icon(
                      Icons.home,
                      color: AppColors.white,
                    ),
                    onTap: () => log('Item3'),
                  ),
                ],
              ),
            ),
            body: screens[currentIndex],
          ),
        ],
      ),
    );
  }
}
