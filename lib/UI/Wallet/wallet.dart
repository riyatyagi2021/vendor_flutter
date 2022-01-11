import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/UI/Wallet/wallet_bloc.dart';
import 'package:vendor_flutter/UI/Wallet/wallet_state.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({Key? key}) : super(key: key);

  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => SafeArea(
          child: Scaffold(
              body: BlocConsumer<WalletBloc, WalletState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.isSuccess) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bg_img.png'),
                                fit: BoxFit.cover)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppUtils.Header(context, 'My Wallet'),
                            SizedBox(
                              height: 10,
                            ),
                            AppUtils.walletMoney(COLOR.DarkMaroon, 50.0, "0"),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Transactions",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 500.h,
                              child: ListView.builder(
                                itemCount: state.model.responseData
                                    ?.transactionList?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var walletAmount = state.model.responseData
                                      ?.transactionList?[index].walletAmount
                                      .toString();
                                  var coupanWallet = state
                                      .model
                                      .responseData
                                      ?.transactionList?[index]
                                      .couponWalletAmount
                                      .toString();
                                  var orderId = state.model.responseData
                                      ?.transactionList?[index].orderId
                                      .toString();

                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 20),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Amount Credited by order",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "W  ",
                                                      style: TextStyle(
                                                          color: COLOR.Yellow,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      "+\u{20B9}${walletAmount}",
                                                      style: TextStyle(
                                                          color: COLOR.Green,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Order ID : ${orderId}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "CW  ",
                                                      style: TextStyle(
                                                          color: COLOR.Yellow,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    Text(
                                                      "-\u{20B9}${coupanWallet}",
                                                      style: TextStyle(
                                                          color: COLOR.Maroon,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Payment Status",
                                                  style: TextStyle(
                                                      color: COLOR.Blue),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: COLOR.LightGreen,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 4),
                                                  child: Text("Completed",
                                                      style: TextStyle(
                                                          color: COLOR.Green,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  "Mon, 12 Jul 2021, 09:46 am",
                                                  style: TextStyle(
                                                      color: COLOR.Black
                                                          .withOpacity(0.5)),
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  }))),
    );
  }
}
