import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/assets.dart';
import 'package:game/ui/bottom_tab_bar.dart';
import 'package:game/ui/bottom_tab_item.dart';
import 'package:game/ui/play_now_button.dart';
import 'package:game/utils/device_utils.dart';

class QuizScreen extends StatelessWidget {
  static const routeName = '/quiz-page';

  String question;

  QuizScreen({required this.question});

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
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Transform.translate(
                    offset:
                        Offset(-DeviceUtils.getScaledWidth(context, 0.05), 0),
                    child: Container(
                      width: DeviceUtils.getScaledWidth(context, 0.37),
                      height: DeviceUtils.getScaledHeight(context, 0.07),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xFFA2B53A)),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Stack(
                    children: [
                      Container(
                        width: DeviceUtils.getScaledWidth(context, 0.10),
                        height: DeviceUtils.getScaledHeight(context, 0.06),
                        decoration: BoxDecoration(
                          color: Color(0xFFB3C519),
                          border:
                              Border.all(color: Color(0xFF355036), width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: FittedBox(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "15",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 0.1
                                    ..color = const Color(0xFFFFFFFF),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
