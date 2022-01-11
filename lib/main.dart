import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_flutter/UI/Home/home.dart';

import 'UI/Auth/login_bloc.dart';
import 'UI/Auth/login_view.dart';
import 'UI/Home/home_bloc.dart';
import 'Utils/preference_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const Splash(),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String ACCESS_TOKEN = "";

  getAccessToken() async {
    await PreferenceUtils.getAccessToken().then((token) {
      ACCESS_TOKEN = token.toString();
      print(ACCESS_TOKEN + "  accesstoken");
    });
  }

  @override
  void initState() {
    super.initState();
    getAccessToken();
    Timer(Duration(seconds: 2), () {
      if (ACCESS_TOKEN == "null") {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<LoginBloc>(
                      create: (context) => LoginBloc(),
                      child: Login(),
                    )));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<HomeBloc>(
                      create: (context) => HomeBloc(),
                      child: HomePage(),
                    )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(right: 30),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_img.png'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/ic_cafe_1.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    'Kitchen Kilter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    '---  WE SERVE PASSION  ---',
                    style: TextStyle(
                        fontSize: 11, color: Colors.black.withOpacity(0.5)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
