import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';
import '../utils/device_utils.dart';

class TopBar extends StatefulWidget {
  final String userName;
  const TopBar({Key? key, required this.userName}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    FacebookUser facebookUser = Provider.of<FacebookUser>(context);
    return facebookUser.isLoggedIn
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            width: double.infinity,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        color: const Color.fromRGBO(0, 171, 189, 0.8),
                        height: DeviceUtils.getScaledHeight(context, 0.08),
                        width: DeviceUtils.getScaledWidth(context, 0.75),
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: DeviceUtils.getScaledWidth(context, 0.15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${facebookUser.name}@',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: DeviceUtils.getScaledFontSize(
                                      context, 14),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromRGBO(0, 171, 189, 1),
                  radius: DeviceUtils.getScaledHeight(context, 0.06),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 171, 189, 1),
                    backgroundImage: NetworkImage(facebookUser.imageUrl),
                    radius: DeviceUtils.getScaledHeight(context, 0.05),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
