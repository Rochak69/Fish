import 'dart:async';

import 'package:fish_shop/res/colors.dart';
import 'package:fish_shop/ui/home_listing/home_listing.dart';
import 'package:fish_shop/ui/login/login.dart';
import 'package:fish_shop/ui/utils/preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), navigationPage);
    super.initState();
  }

  Future<void> navigationPage() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    Preferences preferences = Preferences();
    final prefs = await SharedPreferences.getInstance();
    var run = prefs.getBool('first_run');
    if (run == null) {
      await preferences.removeAll();
      prefs.setBool('first_run', false);
    }

    if (!mounted) {
      return;
    }
    bool isLogin = await preferences.getBool(Preference.isLogin);
    if (isLogin) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeListing(),
          ),
          (route) => false);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
