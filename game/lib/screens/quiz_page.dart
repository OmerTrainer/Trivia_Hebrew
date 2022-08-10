import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/assets.dart';
import 'package:game/ui/bottom_tab_bar.dart';
import 'package:game/ui/bottom_tab_item.dart';
import 'package:game/ui/play_now_button.dart';
import 'package:game/utils/device_utils.dart';
import 'dart:async';
import 'dart:html';
import '../ui/quiz_TopBar.dart';
import '../entities/questions_class.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz-page';

  final Questions question;

  QuizScreen({required this.question});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  Timer? timer;
  bool pressAttention = false;
  bool pressAttentionNotReal = false;
  int notrealanswer = -1;
  bool isDisable = false;

  List<Widget> buildAnswers(List answer) {
    List<Widget> buttons = [];
    for (var index = 0; index < answer.length; index++) {
      buttons.add(GestureDetector(
          onTap: isDisable
              ? () {}
              : () {
                  if (widget.question.answers[index].correctAnswer) {
                    setState(() {
                      pressAttention = true;
                      isDisable = true;
                    });
                  } else {
                    setState(() {
                      notrealanswer = index;
                      pressAttentionNotReal = true;
                      isDisable = true;
                    });
                  }
                },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color:
             pressAttention && widget.question.answers[index].correctAnswer
                    ? Color(0xFFB8D192)
                    : pressAttentionNotReal &&
                            widget.question.answers[index].correctAnswer
                        ? Color(0xFFB8D192)
                        : notrealanswer == index
                            ? Colors.red
                            : Color(0xFFC3C8DC),),
            width: DeviceUtils.getScaledWidth(context, 0.8),
            height: DeviceUtils.getScaledHeight(context, 0.07),
            margin: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                widget.question.answers[index].title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: DeviceUtils.getScaledFontSize(context, 14),
                ),
              ),
            ),
          )));
    }
    return buttons;
  }

  void test(bool goodanswer, int questionINdex) {
    if (goodanswer == false) {}
  }

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
        if(seconds == 0){
          Navigator.of(context).pop();
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
              // middle of the page
              Container(
                color: Colors.white.withOpacity(0.5),
                height: DeviceUtils.getScaledHeight(context, 0.35),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        widget.question.question,
                        style: TextStyle(
                            fontSize:
                                DeviceUtils.getScaledFontSize(context, 17),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: DeviceUtils.getScaledWidth(context, 0.78),
                      height: DeviceUtils.getScaledHeight(context, 0.25),
                      child: Image.network(
                        widget.question.imageUrl,
                      ),
                    ),
                  ],
                ),
              ),
              //end of middle of the page
              Column(children: buildAnswers(widget.question.answers))
            ],
          ),
        ));
  }
}
