import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor_flutter/Constants/constants.dart';
import 'package:vendor_flutter/UI/Auth/forgot/forgot_view.dart';
import 'package:vendor_flutter/UI/Auth/login_model.dart';
import 'package:vendor_flutter/UI/Home/home.dart';
import 'package:vendor_flutter/UI/Home/home_bloc.dart';
import 'package:vendor_flutter/Utils/appUtils.dart';
import 'package:vendor_flutter/Utils/preference_utils.dart';
import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

final themeColor = new Color(0xffF16019);

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginModel model = LoginModel();
  bool _isHidden = true;
  bool isLoading = false;

  void togglePassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
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
    final LoginBloc loginbloc = BlocProvider.of<LoginBloc>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isSuccess) {
            isLoading = false;
            var accessToken = state
                .model.responseData?.employeeProfile?.accessToken
                .toString();
            print(accessToken);
            LoginModel model = state.model;
            PreferenceUtils.setAccessToken(state
                .model.responseData!.employeeProfile!.accessToken
                .toString());
            PreferenceUtils.setUserProfile(
                state.model.responseData!.employeeProfile!);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider<HomeBloc>(
                          create: (context) => HomeBloc(),
                          child: HomePage(model: model),
                        )));

            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (BuildContext context) => HomePage()));
                  } else {
            isLoading = false;
            print(state.isError.toString() +
                "  gdvbhsnkm,sdfdddddddddddsdfghbjnmk,");
            Fluttertoast.showToast(msg: "Check email or password");
                  }
                },
              builder: (context, state) {
          return Stack(
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
                          Row(
                            children: const [
                              Icon(
                                Icons.lock_outlined,
                                size: 20,
                                color: COLOR.Black,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Password",
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
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: password,
                              obscureText: _isHidden,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(' '),
                                LengthLimitingTextInputFormatter(20),
                              ],
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'Must be more than 6 charaters';
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        color: COLOR.Black, width: 1.0),
                                  ),
                                  suffixIcon: InkWell(
                                      onTap: togglePassword,
                                      child: Icon(
                                        _isHidden
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: COLOR.Black,
                                      )),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 20),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1.5, color: COLOR.Black),
                                      borderRadius: BorderRadius.circular(25)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1.5, color: COLOR.Black),
                                      borderRadius: BorderRadius.circular(25)),
                                  hintText: "Type Password",
                                  hintStyle: TextStyle(
                                      color: COLOR.Black.withOpacity(0.3))),
                            ),
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                AppUtils.launchScreen(context, Forgot());
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: COLOR.Black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 15),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  loginbloc.add(
                                      OnLoginApiHit(email.text, password.text));
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

            ],
          );
        },
      )),
    );
  }
}
