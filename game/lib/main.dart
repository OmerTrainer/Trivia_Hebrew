import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/assets.dart';
import 'package:game/ui/bottom_tab_bar.dart';
import 'package:game/ui/bottom_tab_item.dart';
import 'package:game/ui/play_now_button.dart';
import 'package:game/utils/device_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map? _userData;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userData == null
          ? showDialog(
              barrierDismissible: false,
              context: context,
              builder: ((context) => AlertDialog(
                    backgroundColor: const Color.fromRGBO(161, 199, 224, 0.75),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: (() async {}),
                              child: Container(
                                color: Colors.white,
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.08),
                                width: DeviceUtils.getScaledWidth(context, 0.6),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      child: Image.asset(
                                        Assets.googleIcon,
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20.0,
                                        left: 10,
                                      ),
                                      child: Text(
                                        'התחברות עם גוגל',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              DeviceUtils.getScaledFontSize(
                                            context,
                                            14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: (() async {
                                final result = await FacebookAuth.i.login(
                                    permissions: ["public_profile", "email"]);
                                if (result.status == LoginStatus.success) {
                                  final requestData = await FacebookAuth.i
                                      .getUserData(
                                          fields: "email, name, picture");

                                  setState(() {
                                    _userData = requestData;
                                    print(_userData);
                                    Navigator.of(context, rootNavigator: true)
                                        .pop();
                                  });
                                }
                              }),
                              child: Container(
                                color: const Color.fromRGBO(0, 153, 221, 0.5),
                                height:
                                    DeviceUtils.getScaledHeight(context, 0.08),
                                width: DeviceUtils.getScaledWidth(context, 0.6),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      child: Image.asset(
                                        Assets.facebookIcon,
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 20.0,
                                        left: 10,
                                      ),
                                      child: Text(
                                        'התחברות עם פייסבוק',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              DeviceUtils.getScaledFontSize(
                                            context,
                                            14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(Assets.backgroundImage),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const BottomNavBar(),
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(Assets.peakcockImage),
                    const Positioned(bottom: 0, child: PlayNowButton()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
