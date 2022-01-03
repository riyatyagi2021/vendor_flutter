import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/UI/Auth/forgot/ForgotModel.dart';
import 'package:vendor_flutter/UI/Auth/forgot/forgot_repo.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';


class Forgot extends StatefulWidget {
  const Forgot({Key? key}) : super(key: key);

  @override
  _ForgotState createState() => _ForgotState();
}

final themeColor = new Color(0xffF16019);

class _ForgotState extends State<Forgot> {
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  ForgotRepository forgotRepository=ForgotRepository();
  ForgotModel forgotModel=ForgotModel();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body:Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 100),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/bg_img.png'),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Image.asset(
                             IMAGE.LOGO,
                              height: 150,
                              width: 150,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.email_outlined,
                                size: 20,
                                color: COLOR.Black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Email",
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
                          Form(
                            key: formKey,
                            child: SizedBox(
                              height: 80,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (value) => validateEmail(value),
                                // inputFormatters:[ LengthLimitingTextInputFormatter(15)],
                                decoration:
                                    AppUtils.BorderDecoration("Type Email"),
                                onEditingComplete: () =>
                                    FocusScope.of(context).nextFocus(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 1,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              child: const Text(
                                'SUBMIT',
                                style: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  apiCall();
                                  Navigator.pop(context);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: COLOR.Black,
                                onPrimary: COLOR.White,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              child: const Text(
                                'CANCEL',
                                style: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                              Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                onPrimary: COLOR.Black,
                                primary: COLOR.White,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              isLoading
                  ? Container(
                      color: Colors.green.shade50.withOpacity(0.8),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: AppUtils.loader(),
                    )
                  : Container()

            ],)
          ));
        }

   apiCall() async{
    forgotModel=await forgotRepository.loginApi(email.text.toString());
    Fluttertoast.showToast(msg: forgotModel.responseData!.message.toString());
   }
  }

