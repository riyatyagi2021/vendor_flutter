import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(),
      body: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            decoration: const BoxDecoration(
                image:DecorationImage(
                    image: AssetImage('assets/images/bg_img.png'),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  IconButton(
                    iconSize: 30,
                    color: Colors.black,
                    icon: Icon(Icons.menu),
                    onPressed: () => {
                      scaffoldKey.currentState?.openDrawer()
                    },
                  ),
                  Text("MOB's Menu",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  ),),
                  Text(""),
                ]

              )
              ],
            ),
          ),),
    );
  }
}
