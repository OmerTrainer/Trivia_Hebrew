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
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userData == null
          ? showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    content: ElevatedButton(
                        child: Text('Login'),
                        onPressed: () async {
                          final result = await FacebookAuth.i
                              .login(permissions: ["public_profile", "email"]);
                          if (result.status == LoginStatus.success) {
                            final requestData = await FacebookAuth.i
                                .getUserData(fields: "email, name");

                            setState(() {
                              _userData = requestData;
                            });
                          }
                        }),
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
