import 'package:flutter/material.dart';
import 'package:game/ui/top_bar.dart';
import 'package:provider/provider.dart';

import '../assets.dart';
import '../providers/user_provider.dart';
import '../ui/play_now_button.dart';
import '../utils/device_utils.dart';

class HomePage extends StatefulWidget {
  Map? userData;

  HomePage({Key? key, required this.userData}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FacebookUser facebookUser =
        Provider.of<FacebookUser>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.only(top: 38.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          facebookUser.isLoggedIn ? const TopBar() : const SizedBox.shrink(),
          const Spacer(),
          Container(
            height: DeviceUtils.getScaledHeight(context, 0.41),
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(Assets.peakcockImage),
                Positioned(
                  bottom: 0,
                  child: PlayNowButton(
                    userData: widget.userData,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
