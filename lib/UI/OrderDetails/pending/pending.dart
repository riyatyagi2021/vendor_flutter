import 'package:flutter/material.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';

class RequestPending extends StatefulWidget {
  const RequestPending({Key? key}) : super(key: key);

  @override
  _RequestPendingState createState() => _RequestPendingState();
}

class _RequestPendingState extends State<RequestPending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_img.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              AppUtils.Header(context, "Order Details"),
              SizedBox(
                height: 10,
              ),
              AppUtils.orderDetails("Request Pending"),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 105,
                          width: 100,
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
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 15.0, bottom: 5),
                              child: Text("Cold Coffee"),
                            ),
                            Text(
                              "\u{20B9}30.0",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("2 Item |  \u{20B9}60.0"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ordered By "),
                            Text(
                              "Riya Tyagi",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Product Item"),
                            Text(
                              "2 items",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("User Contact"),
                            Text(
                              "+91 7409616826",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ordered Id"),
                            Text(
                              "# 1234567890",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Amount"),
                            Text(
                              "\u{20B9}50.0",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: COLOR.Black,
                      onPrimary: COLOR.White,

                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ) ,
                    child: Text("Completed")),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      primary: COLOR.DarkMaroon,
                      onPrimary: COLOR.White,
                      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ) ,
                    child: Text("Cancel Order")),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
