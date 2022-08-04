import 'package:flutter/material.dart';
import 'package:game/utils/device_utils.dart';

class PlayNowButton extends StatelessWidget {
  const PlayNowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 153, 51, 1),
          ),
          alignment: Alignment.center,
          height: DeviceUtils.getScaledHeight(context, 0.08),
          width: DeviceUtils.getScaledWidth(context, 0.7),
          child: Text(
            '!שחק עכשיו ',
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
