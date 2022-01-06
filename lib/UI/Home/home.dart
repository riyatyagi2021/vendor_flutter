import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/UI/Auth/login_model.dart';
import 'package:vendor_flutter/UI/Food/Add/add_food.dart';
import 'package:vendor_flutter/UI/Food/Delete/delete.dart';
import 'package:vendor_flutter/UI/Food/Edit/edit.dart';
import 'package:vendor_flutter/UI/Home/AbousUs/about_us.dart';
import 'package:vendor_flutter/UI/UserRequest/user_req.dart';
import 'package:vendor_flutter/UI/Wallet/wallet.dart';
import 'package:vendor_flutter/Utils/preference_utils.dart';
import 'home_bloc.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  LoginModel? model;
 HomePage({Key? key, this.model}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String NAME="" ;
  String EMAIl="" ;
  String PHONE="" ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer:drawer(),
        body: BlocConsumer<HomeBloc,HomeState>(
        listener:(context,state){} ,
        builder: (context,state){
          if(state.isSuccess){
            var apiData=state.model.responseData;
            PreferenceUtils.getUserProfile().then((profile) {
              NAME= profile.firstName.toString();
              EMAIl = profile.email.toString();
              PHONE= profile.phone.toString();
              print(EMAIl+"name");
              print(NAME+"name");
              print(PHONE+"name");
            });
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 10,),
              decoration: const BoxDecoration(
                  image:DecorationImage(
                      image: AssetImage('assets/images/bg_img.png'),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homeHeader(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(" Hello ${widget.model?.responseData?.employeeProfile?.firstName.toString()},",style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: COLOR.Black
                        ),),
                        SizedBox(height: 5,),
                        Text("WELCOME BACK! ",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: COLOR.Black
                        ),),
                        SizedBox(height: 10,),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddFood())),
                            child: Image.asset('assets/images/ic_add_food.png',fit: BoxFit.fitWidth,)),
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          child: Container(
                            height: 509,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: apiData?.foodItemList?.length,
                              itemBuilder: (BuildContext context, int index) {

                                var foodName=apiData?.foodItemList?[index].name;
                               var price= apiData?.foodItemList?[0].price;

                                return Container(
                                  height: 110,
                                  width: double.infinity,
                                  child: Card(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0,top: 10,bottom: 10),
                                              child: Container(
                                                height: 90,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                     // image: AssetImage('assets/images/coldcoffee.jpeg',),
                                                        image: NetworkImage('${apiData?.foodItemList?[index].images?[0]}',),
                                                        fit: BoxFit.cover
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                    color: Colors.grey
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(" ${foodName}",style: TextStyle(
                                                    fontSize: 14,
                                                    color: COLOR.Black
                                                ),),
                                                SizedBox(height: 4,),
                                                Text("\u{20B9}${price}",style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: COLOR.Black
                                                ),)
                                              ],
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed:(){
                                              bottomSheet(context,foodName!,price!);
                                            }, icon: Icon(Icons.more_vert_rounded,color: COLOR.Black,size: 30,))
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }else{
            return Container();
          }
    })
      ),
    );
  }

  Widget drawer()=> BlocConsumer<HomeBloc,HomeState>(
          listener:(context,state){} ,
          builder: (context,state){
            var name=widget.model?.responseData?.employeeProfile?.firstName.toString();
            var lastName=widget.model?.responseData?.employeeProfile?.lastName.toString();
            var email=widget.model?.responseData?.employeeProfile?.email.toString();
            var phone=widget.model?.responseData?.employeeProfile?.phone.toString();

            return ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(26.0),bottomRight:Radius.circular(26) ),
              child: Drawer(
                child: Container(
                  decoration: const BoxDecoration(
                      image:DecorationImage(
                          image: AssetImage('assets/images/drawer_img.png'),
                          fit: BoxFit.cover
                      )
                  ),
                  padding: EdgeInsets.only(left: 20,right: 15,top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child:GestureDetector(
                          onTap: ()=>Navigator.pop(context),
                          child: Image.asset('assets/images/ic_cross_c.png',height: 20,width: 20,color: COLOR.White,),
                        ) ,
                      ),
                      SizedBox(height: 15,),
                      Text("${name} ${lastName}",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: COLOR.White
                      ),),
                      SizedBox(height: 15,),
                      Text("${email}",style: TextStyle(
                          fontSize: 17,
                          color: Colors.white70
                      ),),
                      SizedBox(height: 7,),
                      Text("+91 ${phone}",style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: COLOR.White
                      ),),
                      SizedBox(height: 15,),
                      Divider(thickness: 2,endIndent: 20,color: COLOR.Grey.withOpacity(0.2),),
                      SizedBox(height: 15,),
                      //AppUtils.walletMoney(COLOR.Maroon, 50, "20"),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: COLOR.Maroon,
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
                            Text("\u{20B9} 50.0",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: COLOR.White
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserRequest())),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: COLOR.Maroon,
                              ),
                              child: Image.asset('assets/images/ic_my_order.png',height: 20,width: 20,color: COLOR.White,),
                            ),
                            Text("User Request",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: COLOR.White
                            ),),
                          ],
                        ),
                      ),
                      Divider(thickness: 2,indent: 50,endIndent: 20,color: COLOR.Grey.withOpacity(0.2),),
                      SizedBox(height: 10,),
                      InkWell(

                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyWallet())),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: COLOR.Maroon,
                              ),
                              child: Image.asset('assets/images/ic_wallet_1.png',height: 20,width: 20,),

                            ),
                            Text("My Wallet",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: COLOR.White
                            ),),
                          ],
                        ),
                      ),
                      Divider(thickness: 2,indent: 50,endIndent: 20,color: COLOR.Grey.withOpacity(0.2),),

                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
                        },
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: COLOR.Maroon,
                              ),
                              child: Image.asset('assets/images/ic_about_us.png',height: 20,width: 20,color: COLOR.White,),
                            ),
                            Text("About Us",style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: COLOR.White
                            ),),
                          ],
                        ),
                      ),
                      Divider(thickness: 2,indent: 50,endIndent: 20,color: COLOR.Grey.withOpacity(0.2),),
                      SizedBox(height: 100,),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.logout,color: COLOR.Black,),
                          label: Text("Logout",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: COLOR.Black
                          ),),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: COLOR.White,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),
            );
          }
      );


  Widget homeHeader()=>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
           GestureDetector(
          onTap: ()=>scaffoldKey.currentState?.openDrawer(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
            child: Image.asset('assets/images/ic_menu.png',height: 25,width: 25,color: COLOR.Black,),
          ),
        ) ,

        Text("MOB's Menu",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: COLOR.Black
        ),),
        Text(""),   //for using row property
      ]
  );

  bottomSheet(context,String foodname,int Price){
   showModalBottomSheet<void>(
        isDismissible: false,
        enableDrag: false,
        context: context,shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      ),
    ),  builder: (BuildContext ctxt){
      return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: COLOR.White,
            borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20) )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text("Add Food Item",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: COLOR.Black
                    ),),
                  ),
                  GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: Image.asset('assets/images/ic_cross_c.png',height: 20,width: 20,),
                  )
                ],
              ),
              SizedBox(height: 20,),
              GestureDetector(

                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditFood(foodName:foodname,price:Price)));
                },
                child: Row(
                  children: [
                    Image.asset('assets/images/ic_edit.png',height: 20,width: 30,),
                    SizedBox(width: 20,),
                    Text("Edit Food",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: COLOR.Black
                    ),)
                  ],
                ),
              ),
              Divider(thickness: 1,indent: 50,endIndent: 20,height: 30,),
             // SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  DeletePopUpState().showDialogBox(context);
                },
                child: Row(
                  children: [
                    Image.asset('assets/images/ic_delete.png',height: 20,width: 30,),
                    SizedBox(width: 20,),
                    Text("Delete Food",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: COLOR.Black
                    ),)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });

  }



}
