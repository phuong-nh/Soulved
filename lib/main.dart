import 'package:chalie_youthon/views/screens/home_screen.dart';
import 'package:chalie_youthon/unfinished.dart';
import 'package:chalie_youthon/views/screens/splash_screen.dart';
import 'package:chalie_youthon/views/theme.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'challenge_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Chalie());
}

var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => HomeScreen(),
};
class Chalie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChallengeProvider(
      child: MaterialApp(
        home: SplashScreen(),
        routes: routes,
      ),
    );
  }
}
