import 'package:flutter/material.dart';
import 'package:game/assets.dart';
import 'package:game/utils/device_utils.dart';

class TopOfThePage extends StatelessWidget {
  const TopOfThePage({
    Key? key,
    required this.width,
    required this.seconds,
  }) : super(key: key);

  final double width;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceUtils.getScaledHeight(context, 0.22),
      width: double.infinity,
      child: Row( 
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                Assets.monkey,
                height: DeviceUtils.getScaledHeight(context, 0.20),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(DeviceUtils.getScaledWidth(context, 0.08)),
              child: Stack(children: [
                Container(
                  width: DeviceUtils.getScaledWidth(context, 0.40),
                  height: DeviceUtils.getScaledHeight(context, 0.07),
                  decoration: const BoxDecoration(
                    color: Color(0xFFCCB178),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  width: width,
                  height: DeviceUtils.getScaledHeight(context, 0.07),
                  decoration: const BoxDecoration(color: Color(0xFFA2B53A)),
                ),
              ]),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: DeviceUtils.getScaledHeight(context, 0.13),
              height: DeviceUtils.getScaledHeight(context, 0.13),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.hourGlass,
                      width: DeviceUtils.getScaledWidth(context, 0.11),
                      height: DeviceUtils.getScaledHeight(context, 0.13),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Center(
                    child: Transform.translate(
                      offset: Offset(-DeviceUtils.getScaledWidth(context, 0.05),
                          DeviceUtils.getScaledHeight(context, 0.05)),
                      child: Stack(alignment: Alignment.center, children: [
                        Container(
                          height: DeviceUtils.getScaledHeight(context, 0.06),
                          decoration: BoxDecoration(
                            color: seconds > 5
                                ? const Color(0xFFB3C519)
                                : const Color(0xFFFF0202),
                            border: Border.all(
                                color: const Color(0xFF355036), width: 2),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          seconds.toString(),
                          style: TextStyle(
                            fontSize:
                                DeviceUtils.getScaledHeight(context, 0.03),
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth =
                                  DeviceUtils.getScaledHeight(context, 0.004)
                              ..color = const Color(0xFF355036),
                          ),
                        ),
                        Text(
                          seconds.toString(),
                          style: TextStyle(
                            fontSize:
                                DeviceUtils.getScaledHeight(context, 0.03),
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.fade,
                            color: Colors.white,
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
