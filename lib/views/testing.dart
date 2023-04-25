import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controller/authentication.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  final authController = Get.put(FirebaseAuthentication());
  @override
  void initState() {
    // authController.loadImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("hellow"),
          Obx(() => Text("${authController.name.value}")),
        ],
      ),
    );
  }
}
