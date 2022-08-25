import 'package:flutter/material.dart';
import 'package:game/screens/profile_page.dart';

import '../assets.dart';
import '../utils/device_utils.dart';
import 'bottom_tab_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        height: DeviceUtils.getScaledHeight(context, 0.1),
        color: const Color.fromRGBO(164, 219, 195, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabItem(
              imageUrl: Assets.shopImage,
              onPressed: () => {},
            ),
            BottomTabItem(
              imageUrl: Assets.homeImage,
              onPressed: () => {},
            ),
            BottomTabItem(
              imageUrl: Assets.settingsImage,
              onPressed: () => {},
            ),
            BottomTabItem(
              imageUrl: Assets.profileImage,
              onPressed: () {
                print('sdfjsdlf');
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
