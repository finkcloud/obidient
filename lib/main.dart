import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pgo/constants.dart';
import 'package:pgo/screens/donate_follow.dart';
import 'package:pgo/screens/home_screen.dart';
import 'package:pgo/screens/okwute_videos.dart';
import 'package:pgo/screens/voice_up_screen.dart';
import 'package:pgo/widgets/exit_checker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    _logAppOpen();
    _setAnalyticsProperties();
  }

  void _logAppOpen() async {
    await analytics.logAppOpen();
  }

  void _setAnalyticsProperties() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    await analytics.setUserId(id: packageName);
    await analytics.setUserProperty(
      name: appName,
      value: version,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      debugShowCheckedModeBanner: false,
      title: 'PO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(title: '🗳️ PO 4 PRESIDENT'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  _showPage(int index) {
    final Widget? page;
    switch (index) {
      case 0:
        page = const HomeScreenTab();
        break;
      case 1:
        page = const VoiceUpScreenTab();
        break;
      case 2:
        page = const InOkwutesWordVidoes();
        break;
      default:
        page = const HomeScreenTab();
    }
    return page;
  }

  _exit() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Leaving ?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'),
                ),
                FlatButton(
                  onPressed: () {
                    print("done");
                  },
                  child: const Text('Yes'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))),
          backgroundColor: POAppConstants.colorPrimary,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              textScaleFactor: 1.0,
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Icon(CupertinoIcons.square_pencil),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DonateOrFollow()));
                  },
                  child: const Icon(CupertinoIcons.paperclip)),
            )
          ],
          centerTitle: false,
        ),

        body: DoubleBackToCloseWidget(
          child: _showPage(_pageIndex),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          backgroundColor: POAppConstants.colorPrimary,
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.bounceOut,
          animationDuration: const Duration(milliseconds: 600),
          items: const <Widget>[
            Icon(CupertinoIcons.home, size: 25),
            Icon(CupertinoIcons.add, size: 30),
            Icon(CupertinoIcons.videocam, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
