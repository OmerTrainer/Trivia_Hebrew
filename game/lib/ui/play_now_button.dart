import 'package:flutter/material.dart';
import 'package:game/interfaces/user.dart';
import 'package:game/utils/device_utils.dart';
import 'package:game/services/services.dart';

class PlayNowButton extends StatelessWidget {
  Map? userData;
  PlayNowButton({Key? key, required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Services.lookingForGame(
            context,
            User(
              name: userData!['name'],
              f_id: userData!['id'],
              email: userData!['email'],
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(DeviceUtils.getScaledHeight(context, 0.04)),
          color: const Color.fromRGBO(255, 153, 51, 1),
          boxShadow: kElevationToShadow[24],
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
    );
  }
}
