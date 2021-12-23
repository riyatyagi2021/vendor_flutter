import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendor_flutter/UI/Home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  bool _isHidden = true;
  void togglePassword() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 28,vertical: 100),
              decoration: const BoxDecoration(
                  image:DecorationImage(
                      image: AssetImage('assets/images/bg_img.png'),
                      fit: BoxFit.cover
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Image.asset('assets/images/ic_cafe_1.png',height: 150,width: 150,),
                  ),
                  const SizedBox(height: 50,),
                  Row(
                    children: const [
                      Icon(Icons.email_outlined,size: 20,color: Colors.black,),
                      const SizedBox(width: 10,),
                      Text("Email", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: email,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.black
                            ),
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          hintText: "Type Email",
                          hintStyle: TextStyle(

                              color: Colors.black.withOpacity(0.3))),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: const [
                      Icon(Icons.lock_outlined,size: 20,color: Colors.black,),
                      const SizedBox(width: 10,),
                      Text("Password", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black
                      ),),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: password,
                      obscureText: _isHidden,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: togglePassword,
                            child:  Icon(_isHidden?Icons.visibility_off:Icons.visibility,color: Colors.black,)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(25)),
                          hintText: "Type Password",
                          hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.3))),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ForgotPassword()));
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text('Login',style: TextStyle(fontSize: 15),),
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) => HomePage()));
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                              )
                          )
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
