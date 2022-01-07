import 'package:flutter/material.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/UI/OrderDetails/order_details.dart';
import 'package:vendor_flutter/UI/OrderDetails/pending/pending.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';

enum Status { pending, accepted, completed, cancelled }

class UserRequest extends StatefulWidget {
  const UserRequest({Key? key}) : super(key: key);

  @override
  _UserRequestState createState() => _UserRequestState();
}

class _UserRequestState extends State<UserRequest> {
  Status? reqStatus = Status.pending;

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
              homeHeader(),
              SizedBox(
                height: 10,
              ),
              Container(
                // height: 250,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDetails())),
                            child: Container(
                              height: 105,
                              width: 100,
                              margin: EdgeInsets.only(top: 10, left: 15),
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
                              ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    primary: COLOR.Black,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: Text("Pending"))
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Schedule for",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("2 Item", style: TextStyle(fontSize: 13)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Wed, 29 Dec 2021 | 10:15 PM",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(" \u{20B9}60.0",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: COLOR.Black,
                                  onPrimary: COLOR.White,
                                  padding: EdgeInsets.symmetric(horizontal: 35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                                child: Text("Accept")),
                            ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  primary: COLOR.Maroon,
                                  onPrimary: COLOR.White,
                                  padding: EdgeInsets.symmetric(horizontal: 35),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32.0),
                                  ),
                                ),
                                child: Text("Cancel"))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // height: 250,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => AppUtils.launchScreen(
                                context, RequestPending()),
                            child: Container(
                              height: 105,
                              width: 100,
                              margin: EdgeInsets.only(top: 10, left: 15),
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
                              ElevatedButton(
                                  onPressed: null,
                                  style: ElevatedButton.styleFrom(
                                    primary: COLOR.Black,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 25),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: Text("Pending"))
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Schedule for",
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("2 Item", style: TextStyle(fontSize: 13)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Wed, 29 Dec 2021 | 10:15 PM",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(" \u{20B9}60.0",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                      AppUtils.OrderStatus(
                          "Accepted", COLOR.LightYellow, COLOR.Yellow)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeHeader() =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
        GestureDetector(
          onTap: () => bottomSheetDate(context),
          child: Text(
            "User Request",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: COLOR.Black),
          ),
        ),
        InkWell(
          splashColor: Colors.orange,
          onTap: () => bottomSheetStatus(context),
          child: Image.asset(
            'assets/images/ic_filter.png',
            height: 25,
            width: 25,
          ),
        ),
      ]);

  bottomSheetDate(context) {
    showModalBottomSheet<void>(
        isDismissible: false,
        enableDrag: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext ctxt) {
          return Container(
            //height: 250,
            padding: EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: COLOR.White,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 35.0, top: 30, bottom: 10, right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sort & Filter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: COLOR.Black),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/images/ic_cross_c.png',
                          height: 20,
                          width: 20,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 1),
                                  height: 55,
                                  width: 3,
                                  color: COLOR.DarkMaroon,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, top: 10, bottom: 10),
                                  child: Text(
                                    "Date",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: COLOR.Black),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 180,
                              padding: const EdgeInsets.only(
                                  left: 25, top: 15, bottom: 15, right: 25),
                              color: Colors.grey.withOpacity(0.3),
                              child: Text(
                                "Status",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: COLOR.Black),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1),
                        height: 153,
                        width: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      // VerticalDivider(
                      //   thickness: 1,
                      //   endIndent: 5,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Start Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: COLOR.Black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "31/12/2021",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: COLOR.Black),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "End Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: COLOR.Black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "12/1/2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: COLOR.Black),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Clear All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: COLOR.Black),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: COLOR.Maroon,
                          onPrimary: COLOR.White,
                          padding: EdgeInsets.symmetric(horizontal: 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: Text("Apply"))
                  ],
                )
              ],
            ),
          );
        });
  }

  bottomSheetStatus(context) {
    showModalBottomSheet<void>(
        isDismissible: false,
        enableDrag: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (BuildContext ctxt) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter state) {
            return Container(
              //height: 300,
              padding: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: COLOR.White,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35.0, top: 30, bottom: 10, right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort & Filter",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: COLOR.Black),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            'assets/images/ic_cross_c.png',
                            height: 20,
                            width: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, top: 10, bottom: 10),
                              child: Text(
                                "Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: COLOR.Black),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 1),
                                  height: 50,
                                  width: 3,
                                  color: COLOR.DarkMaroon,
                                ),
                                Container(
                                  width: 146,
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 15, bottom: 15, right: 25),
                                  color: Colors.grey.withOpacity(0.3),
                                  child: Text(
                                    "Status",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: COLOR.Black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 55,
                            ),
                            Divider(
                              thickness: 1,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1),
                        height: 153,
                        width: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Container(
                        height: 150,
                        width: 200,
                        padding: const EdgeInsets.only(
                          left: 10.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: RadioListTile<Status>(
                                toggleable: true,
                                title: Text('Pending'),
                                groupValue: reqStatus,
                                value: Status.pending,
                                onChanged: (Status? value) {
                                  state(() {
                                    reqStatus = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: RadioListTile<Status>(
                                toggleable: true,
                                title: Text('Accepted'),
                                value: Status.accepted,
                                groupValue: reqStatus,
                                onChanged: (Status? value) {
                                  state(() {
                                    reqStatus = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: RadioListTile<Status>(
                                toggleable: true,
                                title: Text('Completed'),
                                value: Status.completed,
                                groupValue: reqStatus,
                                onChanged: (Status? value) {
                                  state(() {
                                    reqStatus = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: RadioListTile<Status>(
                                toggleable: true,
                                title: Text('Cancelled'),
                                value: Status.cancelled,
                                groupValue: reqStatus,
                                onChanged: (Status? value) {
                                  state(() {
                                    reqStatus = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Clear All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: COLOR.Black),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: COLOR.Maroon,
                            onPrimary: COLOR.White,
                            padding: EdgeInsets.symmetric(horizontal: 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          child: Text("Apply"))
                    ],
                  )
                ],
              ),
            );
          });
        });
  }
}
