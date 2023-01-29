import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project/widgets/dashboard_screen_widgets.dart';
import '../controller/authentication.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final authController = Get.put(FirebaseAuthentication());

  // void isLogin() async {
  //   if (authController.uuid.value.isEmpty) {
  //     Get.toNamed('/login');
  //   } else {
  //     print(authController.uuid.value);
  //   }
  // }

  // @override
  // void initState() {
  //   // isLogin();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarScreen(),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StudentTab(),
                  Column(
                    children: [
                      CompanyBasicInfoTab(),
                      SizedBox(
                        height: 10,
                      ),
                      CompanyBasicInfoTab(),
                      SizedBox(
                        height: 10,
                      ),
                      CompanyBasicInfoTab(),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: MediaQuery.of(context).size.width / 5,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: Colors.grey.shade600,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.handshake_outlined,
                              color: Colors.indigo.shade400,
                              size: 30,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                "OFFERS IN HAND",
                                style: GoogleFonts.lato(),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "02",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF666666),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                "Opportunities you have recieved an offer for",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
