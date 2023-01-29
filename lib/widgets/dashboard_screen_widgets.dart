import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarScreen extends StatelessWidget {
  const AppBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/');
                },
                child: Text(
                  "Placecat",
                  style: GoogleFonts.dancingScript(
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (() {
                  Get.toNamed('/');
                }),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/resume-builder');
                },
                child: Text(
                  "Resume Builder",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (() {
                  Get.toNamed('/profile');
                }),
                child: Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CompanyBasicInfoTab extends StatelessWidget {
  const CompanyBasicInfoTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
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
                    "Graduate Trainee Engineer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text("Rockwell Automation")
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
                    "Internship + FullTime",
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
                    "INR 4,32,000",
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
                        " Pan India ",
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
  }
}

class StudentTab extends StatelessWidget {
  const StudentTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: MediaQuery.of(context).size.width / 5.5,
      height: MediaQuery.of(context).size.height / 1.5,
      color: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                height: 125,
                width: 125,
                image: AssetImage("assets/user.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Shashwat Sharma",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "Student",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
          Divider(),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.cases_outlined,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: "   Jobs",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.messenger_outline,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: "   Messages",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.groups_outlined,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: "   Forums",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.people_outlined,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: "   People",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Icon(
                    Icons.content_paste_go_outlined,
                    size: 20,
                  ),
                ),
                TextSpan(
                  text: "   Resumes",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
