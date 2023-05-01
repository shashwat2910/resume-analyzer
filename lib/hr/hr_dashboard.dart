import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/authentication.dart';
import '../widgets/hr/dashboard.dart';

class HRDashboard extends StatefulWidget {
  @override
  State<HRDashboard> createState() => _HRDashboardState();
}

class _HRDashboardState extends State<HRDashboard> {
  final authController = Get.put(FirebaseAuthentication());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HRAppBarScreen(),
            SizedBox(
              height: 20,
            ),
            Obx(
              () => Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height - 150,
                  child: ListView.builder(
                    itemCount: authController.documents.length,
                    itemBuilder: (context, index) {
                      final data = authController.documents[index].data()
                          as Map<String, dynamic>;
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 225,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          border: Border.all(
                            color: Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image(
                                    image: AssetImage("companyLogo.png"),
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['jobRole'] ?? '',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      data['companyName'] ?? '',
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Job Type",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data['employement_type'] ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Cost to Company",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "INR " + data['ctc'] ?? '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Location",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white70,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          data['location'] ?? '',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(),
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "View Details",
                                      style: TextStyle(
                                        color: Colors.indigo.shade400,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 15,
                                        color: Colors.indigo.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                      
                    },
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
