import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/authentication.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final authController = Get.put(FirebaseAuthentication());
  void isLogin() async {
    if (authController.uuid.value.isEmpty) {
      Get.toNamed('/login');
    } else {
      print(authController.uuid.value);
    }
  }

  @override
  void initState() {
    isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  authController.uploadResume();
                },
                child: Text("Upload File")),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await authController.signout();
              },
              child: Text("Sign out!!"),
            ),
          )
        ],
      ),
    ));
  }
}
