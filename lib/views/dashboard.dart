import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controller/storage_service.dart';

import '../controller/authentication.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final authController = Get.put(FirebaseAuthentication());
  final Storage storage = Storage();

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
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if (results == null) {
                    Get.snackbar(
                      'Error',
                      'No files selected',
                      backgroundColor: Colors.red,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return null;
                  }
                  if (results.files.first != null) {
                    var filePath = results.files.single.path;
                    var fileName = results.files.first.name;
                    storage.uploadFile(filePath!, fileName);
                  }
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
