import 'package:flutter/material.dart';
import 'package:game/ui/top_bar.dart';

import '../assets.dart';
import '../ui/play_now_button.dart';
import '../utils/device_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 38.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TopBar(userName: 'omercohen'),
          const Spacer(),
          Container(
            height: DeviceUtils.getScaledHeight(context, 0.41),
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(Assets.peakcockImage),
                const Positioned(
                  bottom: 0,
                  child: PlayNowButton(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
