import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/assets.dart';
import 'package:game/ui/bottom_tab_bar.dart';
import 'package:game/ui/bottom_tab_item.dart';
import 'package:game/ui/play_now_button.dart';
import 'package:game/utils/device_utils.dart';
import 'dart:async';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz-page';

  String question;

  QuizScreen({required this.question});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  Widget buildTime() {
    return Text("$seconds",
        style: TextStyle(
          fontSize: 100,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 10
            ..color = Color(0xFF355036),
        ));
  }

  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
          if(width>0){
          width -= 7.611428571428571;
          }
          if(width<=0){
            width=0;
          }

        }
      });
    });
  }

  late int seconds;
  late double width =DeviceUtils.getScaledWidth(context, 0.37);

  @override
  void initState() {
    super.initState();
    seconds = 20;
    WidgetsBinding.instance.addPostFrameCallback((_) {
    width =   DeviceUtils.getScaledWidth(context, 0.37);
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
          body: Container(
            height: DeviceUtils.getScaledHeight(context, 0.25),
            width: double.infinity,
            padding: const EdgeInsets.all(1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: DeviceUtils.getScaledWidth(context, 0.4),
                  height: DeviceUtils.getScaledHeight(context, 0.28),
                  child: Transform.translate(
                    offset:
                        Offset(-DeviceUtils.getScaledWidth(context, 0.05), 0),
                    child: Image.asset(
                      Assets.monkey,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(-DeviceUtils.getScaledWidth(context, 0.07),0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Stack(children: [
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: DeviceUtils.getScaledWidth(context, 0.37),
                          height: DeviceUtils.getScaledHeight(context, 0.07),
                          decoration: BoxDecoration(
                              color: Colors.amber,),
                        ),
                        AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: width,
                          height: DeviceUtils.getScaledHeight(context, 0.07),
                          decoration: BoxDecoration(
                              color: const Color(0xFFA2B53A)),
                        ),
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 0.13),
                        height: DeviceUtils.getScaledHeight(context, 0.13),
                        child: Image.asset(
                          Assets.hourGlass,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Transform.translate(
                          offset: Offset(
                              -DeviceUtils.getScaledWidth(context, 0.06),
                              DeviceUtils.getScaledHeight(context, 0.045)),
                          child: Container(
                            width: DeviceUtils.getScaledWidth(context, 0.15),
                            height: DeviceUtils.getScaledHeight(context, 0.06),
                            decoration: BoxDecoration(
                              color: Color(0xFFB3C519),
                              border: Border.all(
                                  color: Color(0xFF355036), width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Stack(children: [
                                Text(
                                  seconds.toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 4
                                      ..color = Color(0xFF355036),
                                  ),
                                ),
                                Text(
                                  seconds.toString(),
                                  style: const TextStyle(
                                    fontSize: 25,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
