import 'package:flutter/material.dart';
import 'package:game/assets.dart';
import 'package:game/ui/text_outline.dart';
import 'package:game/utils/device_utils.dart';
import 'dart:async';
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
  bool pressAttentionWrongAnswer = false;
  int notrealanswer = -1;
  bool isDisable = false;

  late int seconds = 20;
  late double width = DeviceUtils.getScaledWidth(context, 0.40);

  void startTimer(double widthTimer) {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (pressAttention == true || pressAttentionWrongAnswer == true) {
          timer!.cancel();
        }
        if (timer!.isActive) {
          if (seconds > 0) {
            seconds--;
            if (width > 0) {
              width -= widthTimer;
            }
            if (width <= 0) {
              width = 0;
            }
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double widthTimer = width / seconds;
      startTimer(widthTimer);
    });
  }

  List<Widget> buildAnswers(List answer) {
    List<Widget> buttons = [];
    for (var index = 0; index < answer.length; index++) {
      buttons.add(Padding(
        padding:
            EdgeInsets.only(top: DeviceUtils.getScaledHeight(context, 0.007)),
        child: GestureDetector(
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
                        pressAttentionWrongAnswer = true;
                        isDisable = true;
                      });
                    }
                  },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: pressAttention &&
                        widget.question.answers[index].correctAnswer
                    ? const Color(0xFFB8D192)
                    : pressAttentionWrongAnswer &&
                            widget.question.answers[index].correctAnswer
                        ? const Color(0xFFB8D192)
                        : notrealanswer == index
                            ? Colors.red
                            : const Color(0xFFC3C8DC),
              ),
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
            )),
      ));
    }
    return buttons;
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
          body: Stack(children: [
            Column(
              children: [
                TopOfThePage(width: width, seconds: seconds),
                Stack(children: [
                  Container(
                    color: Colors.white.withOpacity(0.5),
                    height: DeviceUtils.getScaledHeight(context, 0.35),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.question.question,
                            style: TextStyle(
                                fontSize:
                                    DeviceUtils.getScaledFontSize(context, 17),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: DeviceUtils.getScaledWidth(context, 0.78),
                          height: DeviceUtils.getScaledHeight(context, 0.25),
                          child: Image.network(
                            widget.question.imageUrl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                Column(children: buildAnswers(widget.question.answers))
              ],
            ),
            if (seconds == 0) ...[
              Container(
                color: Colors.white.withOpacity(0.4),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: const Color(0xFFA27264),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: DeviceUtils.getScaledWidth(context, 0.9),
                  height: DeviceUtils.getScaledHeight(context, 0.12),
                  child: Column(
                    children: [
                      TextOutline(
                        text: "!נגמר הזמן",
                        fontsize: DeviceUtils.getScaledFontSize(context, 21),
                        colorOutline: Colors.black,
                        colorFill: Colors.white,
                        fontWeight: 3,
                      ),
                      Expanded(
                        child: Image.asset(
                          Assets.donkeyCrying,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]
          ]),
        ));
  }
}
