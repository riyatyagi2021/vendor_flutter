import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';

class EditFood extends StatefulWidget {
  String? foodName;
  int? price;
   EditFood({Key? key, this.foodName,this.price}) : super(key: key);

  @override
  _EditFoodState createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  TextEditingController newFoodName=TextEditingController();
  TextEditingController newPrice=TextEditingController();
  TextEditingController newQuant=TextEditingController();

  @override
  void initState() {
    super.initState();
    newFoodName.text=widget.foodName.toString();
    newPrice.text=widget.price.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
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
          child: SingleChildScrollView(
            child: Column(

              children: [
                AppUtils.Header(context, "Edit Food Item"),

                ///////////////////////////
                SizedBox(height: 80,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children:  [
                          Image.asset('assets/images/ic_food_item.png',height: 20,width:20,color: COLOR.Black,),
                          const SizedBox(width: 10,),
                          Text("Item Name", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: COLOR.Black
                          ),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          keyboardType: TextInputType.text,
                         controller:newFoodName,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(' '),
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration: AppUtils.BorderDecoration("Type Item Name"),
                        ),
                      ),
                      const SizedBox(height: 10,),

                      ///////////////////////////////////////
                      Row(
                        children:  [
                          Image.asset('assets/images/ic_food_price.png',height: 20,width:20,color: COLOR.Black,),
                          const SizedBox(width: 10,),
                          Text("Price", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: COLOR.Black
                          ),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: newPrice,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(' '),
                            LengthLimitingTextInputFormatter(2),
                          ],
                          decoration: AppUtils.BorderDecoration("Type Price"),
                        ),
                      ),
                      SizedBox(height: 10,),

                      ////////////////////////////////////////
                      Row(
                        children:  [
                          Image.asset('assets/images/ic_food_aq.png',height: 20,width:20,color: COLOR.Black,),
                          SizedBox(width: 10,),
                          Text("Available Quantity", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: COLOR.Black
                          ),),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          keyboardType: TextInputType.number,
                           controller: newQuant,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(' '),
                            LengthLimitingTextInputFormatter(2),
                          ],
                          decoration: AppUtils.BorderDecoration("Type Available Quantity"),
                        ),
                      ),
                      const SizedBox(height: 10,),

                      ///////////////////////////////////////////
                      Row(
                        children:  [
                          Image.asset('assets/images/ic_food_aq.png',height: 20,width:20,color: COLOR.Black,),
                          SizedBox(width: 10,),
                          Text("Add Food Images", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: COLOR.Black
                          ),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            height: 80,
                            width: 90,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                    color: COLOR.Black
                                ),
                                color: COLOR.White
                            ),
                            child: Image.asset('assets/images/ic_food_image.png',height:50 ,width: 50,),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 80,
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/coldcoffee.jpeg',),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: COLOR.White
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 80,
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/coldcoffee.jpeg',),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: COLOR.White
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 130,),
                      ///////////////////////////////

                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text("Save",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: COLOR.White
                          ),),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: COLOR.Black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ) ,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),
      ) ,
    );
  }


}
