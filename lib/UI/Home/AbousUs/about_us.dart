import 'package:flutter/material.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            decoration: const BoxDecoration(
                image:DecorationImage(
                    image: AssetImage('assets/images/bg_img.png'),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                AppUtils.Header(context, 'About Us'),
                SizedBox(height: 50,),
                Image.asset('assets/images/ic_cafe_1.png',height: 100,width: 100,),
                SizedBox(height: 50,),
                Text("Version Name : 1.9 - release",style: TextStyle(
                    fontSize: 18,
                    color: COLOR.Black
                ),),
                SizedBox(height:15,),
                Text("Version Code : 10",style: TextStyle(
                    fontSize: 18,
                    color: COLOR.Black
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
