import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  TextEditingController foodName=TextEditingController();
  TextEditingController price=TextEditingController();
  TextEditingController quant=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    foodName.dispose();
    price.dispose();
    quant.dispose();
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
              AppUtils.Header(context, "Add Food Item"),

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
                         controller: foodName,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(' '),
                          LengthLimitingTextInputFormatter(20),
                        ],
                        decoration: AppUtils.BorderDecoration("Type Item name"),
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
                        controller: price,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(' '),
                          LengthLimitingTextInputFormatter(3),
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
                        controller: quant,
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
                        GestureDetector(

                          child: Container(
                            height: 80,
                            width: 90,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                border: Border.all(
                                  color: COLOR.Black
                                ),
                                color: Colors.white
                            ),
                            child: Image.asset('assets/images/ic_food_image.png',height:50 ,width: 50,),
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
                              color: Colors.grey
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
                              color: Colors.grey
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
                        child: Text("Add Food",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white
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
