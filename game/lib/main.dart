import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/assets.dart';
import 'package:game/screens/home_page.dart';
import 'package:game/ui/bottom_tab_bar.dart';
import 'package:game/ui/bottom_tab_item.dart';
import 'package:game/ui/play_now_button.dart';
import 'package:game/utils/device_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.backgroundImage),
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavBar(),
        body: SizedBox.expand(
          child: HomePage(),
        ),
      ),
    );
  }
}
