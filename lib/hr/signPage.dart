import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/authentication.dart';
import '../widgets/home_screen_widgets.dart';

class HRSignUpPage extends StatefulWidget {
  @override
  State<HRSignUpPage> createState() => _HRSignUpPageState();
}

class _HRSignUpPageState extends State<HRSignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final authController = Get.put(FirebaseAuthentication());

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarScreen(),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up!",
                          style: GoogleFonts.notoSerifTelugu(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "See your growth and get consulting support!",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await authController.signInWithGoogle();
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4.5,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage("google_icon.png"),
                                    width: 35,
                                    height: 35,
                                  ),
                                  Text(
                                    "    Sign up with Google",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "-------------------- or Sign up with Email --------------------",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              hintText: "something@email.com",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              suffixIcon: IconButton(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: _toggle,
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            obscureText: _obscureText,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await authController.signUp(
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Color(0xFF4831D7),
                              ),
                              height: 50,
                              width: MediaQuery.of(context).size.width / 4.5,
                              child: Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () async {
                            Get.toNamed('/login');
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Have an account?   ",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "   Login",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Image(
                      image: AssetImage("org.jpg"),
                      fit: BoxFit.fill,
                      height: 500,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
