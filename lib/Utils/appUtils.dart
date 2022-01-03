import 'package:flutter/material.dart';

import 'package:vendor_flutter/Constants/constants.dart';

class AppUtils{

  static Header(context,String text){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      InkWell(
        splashColor: Colors.orange,
        onTap: () => Navigator.pop(context),
        child: Image.asset(
          'assets/images/ic_back.png',
          height: 20,
          width: 20,
          color: COLOR.Black,
        ),
      ),
      Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: COLOR.Black),
      ),
      Text("")//for using row property
    ]);
  }

  static walletMoney(Color bg, double money,String margin){
    return Container(
      margin: EdgeInsets.only(right: double.parse(margin)),
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: COLOR.DarkMaroon,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/ic_wallet_1.png',height: 20,width: 30,),
              SizedBox(width: 5,),
              Text("Wallet",style: TextStyle(
                //fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: COLOR.White
              ),),
            ],
          ),
          Text("\u{20B9} ${money}",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: COLOR.White
          ),)
        ],
      ),
    );
  }

  static orderDetails(String text){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: COLOR.DarkMaroon,
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/ic_my_order.png',height: 20,width: 30,color: COLOR.White,),
            SizedBox(width: 5,),
            Text(text,style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 15,
                color: COLOR.White
            ),),
          ],
        ),
        SizedBox(height: 5,),
        Text("Mon, 12 Jul 2021, 09:46 am", style: TextStyle(color: COLOR.White.withOpacity(0.8)),)
      ],
    ),
    );
  }

  static launchScreen(context, screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
         builder: (context) => screen
      ),
    );
  }


  static BorderDecoration(String text){
    return InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide:
          BorderSide(color: COLOR.Black, width: 1.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
                color: COLOR.Black
            ),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
            borderSide:BorderSide(
                width: 1.5,
                color: COLOR.Black
            ),
            borderRadius: BorderRadius.circular(25)),
        hintText: text,
        hintStyle: TextStyle(
            color: COLOR.Black.withOpacity(0.5)));
  }


  static OrderStatus(String status, Color bg,Color text ){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(status),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: bg,
                onPrimary: text,
                padding: EdgeInsets.symmetric(horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ) ,
              child: Text(status)),

        ],
      ),
    );
  }








}