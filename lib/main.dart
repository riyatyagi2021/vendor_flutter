import 'dart:async';

import 'package:flutter/material.dart';

import 'UI/Auth/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
  void initState() {
  super.initState();
  Timer(
      Duration(seconds: 2),
          () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => Login()))
  );
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
               image:DecorationImage(
                   image: AssetImage('assets/images/bg_img.png'),
                fit: BoxFit.cover
               )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/ic_cafe_1.png',height: 150,width: 150,),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child:  Text(
                    'Kitchen Kilter',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black
                    ),
                  ),
                ),
               Container(
                 margin: EdgeInsets.only(left: 30),
                 child: Text(
                    '---  WE SERVE PASSION  ---',
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.black.withOpacity(0.5)),
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
