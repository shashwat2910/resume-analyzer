import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/authentication.dart';

class HRJob extends StatefulWidget {
  const HRJob({super.key});

  @override
  State<HRJob> createState() => _HRJobState();
}

class _HRJobState extends State<HRJob> {
  TextEditingController companyName = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController ctc = TextEditingController();
  TextEditingController jobRole = TextEditingController();
  TextEditingController employement_type = TextEditingController();
  final authController = Get.put(FirebaseAuthentication());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await authController.addJob(
            companyName.text,
            location.text,
            ctc.text,
            jobRole.text,
            employement_type.text,
          );
        },
        child: Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade700,
            border: Border.all(color: Colors.deepPurple.shade900),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text("Save"),
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TextFormField(
                      controller: companyName,
                      decoration: InputDecoration(
                        hintText: 'Company Name',
                        labelText: 'Company Name',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TextFormField(
                      controller: location,
                      decoration: InputDecoration(
                        hintText: 'Location',
                        labelText: 'Location',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TextFormField(
                      controller: ctc,
                      decoration: InputDecoration(
                        hintText: 'Package',
                        labelText: 'Package',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TextFormField(
                      controller: jobRole,
                      decoration: InputDecoration(
                        hintText: 'Job Role',
                        labelText: 'Job Role',
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: TextFormField(
                      controller: employement_type,
                      decoration: InputDecoration(
                        hintText: 'Employement Type',
                        labelText: 'Employement Type',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  authController.uploadJD();
                },
                child: Container(
                  width: 200,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text("Upload Job Description"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
