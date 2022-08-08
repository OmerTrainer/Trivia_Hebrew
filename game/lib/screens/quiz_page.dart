import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/assets.dart';
import 'package:game/ui/bottom_tab_bar.dart';
import 'package:game/ui/bottom_tab_item.dart';
import 'package:game/ui/play_now_button.dart';
import 'package:game/utils/device_utils.dart';
import 'dart:async';
import '../ui/quiz_TopBar.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz-page';

  final String question;
  

  QuizScreen({required this.question});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
  
}

class _QuizScreenState extends State<QuizScreen> {

  


  
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
          if (width > 0) {
            width -= 7.611428571428571;
          }
          if (width <= 0) {
            width = 0;
          }
        }
      });
    });
  }

  late int seconds;
  late double width = DeviceUtils.getScaledWidth(context, 0.37);

  @override
  void initState() {
    super.initState();
    seconds = 20;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      width = DeviceUtils.getScaledWidth(context, 0.37);
    });
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Assets.backgroundforest),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              TopOfThePage(width: width, seconds: seconds),
              Container(
                color: Colors.white.withOpacity(0.5),
                height: DeviceUtils.getScaledHeight(context, 0.30),
                width: double.infinity,
                child: Column(children: [
                  Text('question')
                ],),
              ),
            ],
          ),
        ));
  }
}
