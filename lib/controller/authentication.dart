import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/controller/userModel.dart';

class FirebaseAuthentication extends GetxController {
  var uuid = "".obs;
  var emailId = "".obs;

  Future<void> addUser(
    String first_name,
    var middle_name,
    String last_name,
    String course,
    String primary_specialization,
    String roll_number,
    int joining_year,
    int graduation_year,
    String email,
    int phone_number,
    String github,
    String linkedin,
    String addressLine1,
    var addressLine2,
    String state,
    String city,
    int postalcode,
  ) async {
    try {
      final docUser = FirebaseFirestore.instance
          .collection('candidates')
          .doc('${uuid.value}');
      final user = UserModel(
        uuid: uuid.value,
        first_name: first_name,
        middle_name: middle_name,
        last_name: last_name,
        course: course,
        primary_specialization: primary_specialization,
        roll_number: roll_number,
        joining_year: joining_year,
        graduation_year: graduation_year,
        email: email,
        phone_number: phone_number,
        github: github,
        linkedin: linkedin,
        addressLine1: addressLine1,
        addressLine2: addressLine2,
        state: state,
        city: city,
        postalcode: postalcode,
      );
      final jsonData = user.toJson();
      await docUser.set(jsonData, SetOptions(merge: true));
      Get.snackbar(
        'Success',
        'Data Saved Successfully',
        maxWidth: 300,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
      Get.toNamed('/dashboard');
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        'Please check some field',
        backgroundColor: Colors.red,
        maxWidth: 300,
      );
    }
  }

  var name = "".obs;
  Future<void> getUser() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('candidates')
        .doc('${uuid.value}')
        .get();
    name.value = doc['first_name'];
  }

  var imgUrl = "".obs;
  Future<void> loadImage() async {
    final url = await FirebaseStorage.instance
        .ref('${uuid.value}/images/')
        .listAll();
    imgUrl.value = await url.items.first.getDownloadURL().toString();
    print(await url.items.first.getDownloadURL());
  }

  Future<void> addImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'jpg', 'png']);
    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      await FirebaseStorage.instance
          .ref('${uuid.value}/images/$fileName')
          .putData(fileBytes!);
      Get.snackbar(
        'Success',
        'Image Uploaded',
        maxWidth: 300,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } else {
      Get.snackbar(
        'Error',
        'Uploading Image please try again...',
        backgroundColor: Colors.red,
        maxWidth: 300,
      );
    }
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed('/');
  }

  Future<void> uploadResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      // Upload file
      await FirebaseStorage.instance
          .ref('${uuid.value}/resumes/$fileName')
          .putData(fileBytes!);
      Get.snackbar(
        'Success',
        'Resume Uploaded',
        maxWidth: 300,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
      );
    } else {
      Get.snackbar(
        'Error',
        'Uploading Resume please try again...',
        backgroundColor: Colors.red,
        maxWidth: 300,
      );
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = FirebaseAuth.instance.currentUser;
      if (user!.uid.isEmpty) {
        Get.off('/');
      } else {
        uuid.value = user.uid;

        emailId.value = user.email!;
        Get.toNamed('/dashboard');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found for that email.",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 300,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          "Error",
          "Wrong password provided for that user.",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 300,
        );
      }
    }
  }

  Future<void> signInWithGoogle() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    await FirebaseAuth.instance.signInWithPopup(googleProvider);
    Get.toNamed('/dashboard');
  }

  Future<void> verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    } else {
      Get.snackbar(
        "Error",
        "Couldn't send the email.",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> passwordReset(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.snackbar(
        "Success",
        "Please check your mail!",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
      );
      Get.toNamed('/login');
    } catch (e) {
      Get.snackbar(
        "Error",
        "No user account.",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
      );
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.sendEmailVerification();
      Get.snackbar(
        "Success",
        "Please verify your email!",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        maxWidth: 300,
      );
      Get.toNamed('/login');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          "Error",
          "The password provided is too weak.",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 300,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          "Error",
          "The account already exists for that email.",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: 300,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
