import 'package:flutter/material.dart';
import 'package:game/utils/device_utils.dart';
import '../screens/quiz_page.dart';

class PlayNowButton extends StatelessWidget {
  const PlayNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(QuizScreen.routeName);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          alignment: Alignment.center,
          color: const Color.fromRGBO(255, 153, 51, 1),
          height: DeviceUtils.getScaledHeight(context, 0.08),
          width: DeviceUtils.getScaledWidth(context, 0.7),
          child: Text(
            '!שחק עכשיו',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: DeviceUtils.getScaledFontSize(context, 28),
            ),
          ),
        ),
      ),
    );
  }
}
