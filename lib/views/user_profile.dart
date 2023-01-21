import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_project/widgets/userProfile_screen_widgets.dart';

import '../controller/authentication.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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
  //   isLogin();
  //   super.initState();
  // }

  TextEditingController firstName = TextEditingController();
  TextEditingController middleName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  String degree = "B.Tech";
  var degrees = ['B.Tech', 'M.Tech', 'BCA', 'MSC'];

  String course = "Computer Science Engineering";
  var courses = [
    'Computer Science Engineering',
    'Electronics and Communication Engineering',
    'Information Technology Engineering',
    'Mechanical Engineering',
    'Electrical Engineering',
    'Civil Engineering',
    'Chemical Engineering',
    'Automobile Engineering'
  ];

  String countryCode = "+91";
  var countryCodes = [
    '+91',
    '+1',
    '+380',
    '+971',
    '+44',
    '+38',
    '+1664',
    '+82',
    '+850',
    '+49',
    '+233'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: null,
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 0, 50, 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserProfileAppBar(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  // LeftWidget(),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Basic Details",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image(
                              image: AssetImage("assets/user.png"),
                              fit: BoxFit.fill,
                              width: 100,
                              height: 100,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                controller: firstName,
                                decoration: InputDecoration(
                                    hintText: 'First Name',
                                    labelText: 'First Name'),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                controller: middleName,
                                decoration: InputDecoration(
                                    hintText: 'Middle Name',
                                    labelText: 'Middle Name'),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                controller: lastName,
                                decoration: InputDecoration(
                                    hintText: 'Last Name',
                                    labelText: 'Last Name'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: DropdownButton(
                            isExpanded: true,
                            elevation: 2,
                            value: degree,
                            items: degrees.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  degree = newValue!;
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: DropdownButton(
                            isExpanded: true,
                            elevation: 2,
                            value: course,
                            items: courses.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(
                                () {
                                  course = newValue!;
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'MITU19BTCSXXXX',
                                    labelText: 'Roll Number'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: '20XX',
                                    labelText: 'Joining Year'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: '20XX',
                                    labelText: 'Graduation Year'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'youremail@gmail.com',
                                    labelText: 'E-mail'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: DropdownButton(
                                itemHeight: 67.25,
                                elevation: 2,
                                value: countryCode,
                                items: countryCodes.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(
                                    () {
                                      countryCode = newValue!;
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 3.6,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: '8X0XX64X6X',
                                    labelText: 'Phone Number'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'github.com/userprofile',
                                    labelText: 'Github'),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'linkedin.com/userprofile',
                                    labelText: 'LinkedIn'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Line 1',
                              labelText: 'Current Address',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Line 2',
                              labelText: 'Current Address',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Maharashtra',
                                  labelText: 'State',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Pune',
                                  labelText: 'City',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: '******',
                                  labelText: 'Postal Code',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}