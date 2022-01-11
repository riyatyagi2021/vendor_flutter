import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/UI/Food/Add/add_food_model.dart';
import 'package:vendor_flutter/UI/Food/Add/add_food_repo.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  TextEditingController foodName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quant = TextEditingController();

  File? image;
  cameraImage() async {
    try {
      final imageFile =
          await ImagePicker().getImage(source: ImageSource.camera);
      if (imageFile == null) return;
      final fileimage = File(imageFile.path);
      setState(() {
        this.image = fileimage;
      });
    } on PlatformException catch (e) {
      print("${e} allow permission");
    }
  }

  galleryImage() async {
    try {
      final imageFile =
          await ImagePicker().getImage(source: ImageSource.gallery);
      if (imageFile == null) return;
      final fileimage = File(imageFile.path);
      setState(() {
        this.image = fileimage;
      });
    } on PlatformException catch (e) {
      print("${e} allow permission");
      // Fluttertoast.showToast(msg: "${e} allow permission");
    }
  }

  @override
  void dispose() {
    super.dispose();
    foodName.dispose();
    price.dispose();
    quant.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.all(Radius.circular(10));
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_img.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppUtils.Header(context, "Add Food Item"),

                ///////////////////////////
                SizedBox(
                  height: 80,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_food_item.png',
                            height: 20,
                            width: 20,
                            color: COLOR.Black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Item Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: COLOR.Black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          controller: foodName,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(' '),
                            LengthLimitingTextInputFormatter(20),
                          ],
                          decoration:
                              AppUtils.BorderDecoration("Type Item name"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ///////////////////////////////////////
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_food_price.png',
                            height: 20,
                            width: 20,
                            color: COLOR.Black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: COLOR.Black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
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
                      SizedBox(
                        height: 10,
                      ),

                      ////////////////////////////////////////
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_food_aq.png',
                            height: 20,
                            width: 20,
                            color: COLOR.Black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Available Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: COLOR.Black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 60,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: quant,
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(' '),
                            LengthLimitingTextInputFormatter(2),
                          ],
                          decoration: AppUtils.BorderDecoration(
                              "Type Available Quantity"),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ///////////////////////////////////////////
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_food_aq.png',
                            height: 20,
                            width: 20,
                            color: COLOR.Black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add Food Images",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: COLOR.Black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              bottomSheet(context);
                            },
                            child: Container(
                              height: 80,
                              width: 90,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: COLOR.Black),
                                  color: Colors.white),
                              child: Image.asset(
                                'assets/images/ic_food_image.png',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 80,
                            width: 90,
                            child: image == null
                                ? ClipRRect(
                                    borderRadius: radius,
                                    child: Image.asset(
                                      'assets/images/coldcoffee.jpeg',
                                      fit: BoxFit.cover,
                                    ))
                                : ClipRRect(
                                    borderRadius: radius,
                                    child: Image.file(image!)),
                            decoration: BoxDecoration(
                                borderRadius: radius, color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 80,
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/coldcoffee.jpeg',
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.grey),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 130,
                      ),
                      ///////////////////////////////

                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(
                            "Add Food",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            addFood();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: COLOR.Black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext ctxt) {
          return Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera_alt_rounded,
                        size: 40, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                      cameraImage();
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.file_copy, size: 40, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                      galleryImage();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  AddFoodRepository addFoodRepository = AddFoodRepository();
  AddFoodModel addFoodModel = AddFoodModel();
  addFood() async {
    addFoodModel = await addFoodRepository.addFoodApi(
        "", foodName.toString(), "20", image!.absolute, "5");
    print(
        '${addFoodModel.responseData?.foodItem?.name.toString()} New itemmmmmmmmmmm');
  }
}
