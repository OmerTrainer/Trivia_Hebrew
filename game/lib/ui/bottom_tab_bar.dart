import 'package:flutter/material.dart';

import '../assets.dart';
import '../utils/device_utils.dart';
import 'bottom_tab_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool isHomeTabSelected = true;
  bool isShopTabSelected = false;
  bool isSettingsTabSelected = false;
  bool isProfileTabSelected = false;

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
              onPressed: () => {
                setState(() {
                  isShopTabSelected = !isShopTabSelected;
                  isHomeTabSelected = false;
                  isSettingsTabSelected = false;
                  isProfileTabSelected = false;
                })
              },
              isTabSelected: isShopTabSelected,
            ),
            BottomTabItem(
              imageUrl: Assets.homeImage,
              onPressed: () => {
                setState(() {
                  isHomeTabSelected = !isHomeTabSelected;
                  isShopTabSelected = false;
                  isSettingsTabSelected = false;
                  isProfileTabSelected = false;
                })
              },
              isTabSelected: isHomeTabSelected,
            ),
            BottomTabItem(
              imageUrl: Assets.settingsImage,
              onPressed: () => {
                setState(() {
                  isSettingsTabSelected = !isSettingsTabSelected;
                  isShopTabSelected = false;
                  isHomeTabSelected = false;
                  isProfileTabSelected = false;
                })
              },
              isTabSelected: isSettingsTabSelected,
            ),
            BottomTabItem(
              imageUrl: Assets.profileImage,
              onPressed: () => {
                setState(() {
                  isProfileTabSelected = !isProfileTabSelected;
                  isShopTabSelected = false;
                  isSettingsTabSelected = false;
                  isHomeTabSelected = false;
                })
              },
              isTabSelected: isProfileTabSelected,
            ),
          ],
        ),
      ),
    );
  }
}
