import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/widgets/dashboard_screen_widgets.dart';

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
          children: [
            AppBarScreen(),
            SizedBox(height: 15),
            
          ],
        ),
      ),
    );
  }
}











// child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 25,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 3.5,
//                 child: TextFormField(
//                   controller: name,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                     hintText: "Name",
//                     hintStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                     labelText: "Name",
//                     labelStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 3.5,
//                 child: TextFormField(
//                   controller: backlog,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                     hintText: "0",
//                     hintStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                     labelText: "Number of backlogs",
//                     labelStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 3.5,
//                 child: TextFormField(
//                   controller: phone,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                     hintText: "9xxxx1xxx9",
//                     hintStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                     labelText: "Phone Number",
//                     labelStyle: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   authController.addUser(
//                     name.value.text,
//                     int.parse(backlog.text),
//                     int.parse(phone.text),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(32),
//                     color: Color(0xFF4831D7),
//                   ),
//                   height: 50,
//                   width: MediaQuery.of(context).size.width / 4.5,
//                   child: Center(
//                     child: Text(
//                       "Submit",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: ElevatedButton(
//                     onPressed: () async {
//                       authController.uploadResume();
//                     },
//                     child: Text("Upload File")),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     await authController.signout();
//                   },
//                   child: Text("Sign out!!"),
//                 ),
//               )
//             ],
//           ),
//         ),