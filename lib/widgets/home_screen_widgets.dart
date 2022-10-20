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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "About Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: (() {
                  Get.toNamed('/login');
                }),
                child: Text(
                  "Login/Signup",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image(
            image: AssetImage("img1.jpg"),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              children: [
                Text(
                  "Who We Are ???",
                  style: GoogleFonts.satisfy(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "We make the recruitment process hassle free for Job Recruiters. We give analysis detail of all candidates applied \nfor job to HR.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mcLaren(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SecondWidget extends StatelessWidget {
  const SecondWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Image(
            image: AssetImage("resume_analyze.jpg"),
            height: 300,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
        Expanded(
          child: Image(
            image: AssetImage("resume_analyze.jpg"),
            height: 300,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
        Expanded(
          child: Image(
            image: AssetImage("resume_analyze.jpg"),
            height: 300,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
      ],
    );
  }
}

class ThirdWidget extends StatelessWidget {
  const ThirdWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Image(
            image: AssetImage("resume_analyze.jpg"),
            height: 300,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
        Expanded(
          child: Image(
            image: AssetImage("resume_analyze.jpg"),
            height: 300,
            width: MediaQuery.of(context).size.width / 3.5,
          ),
        ),
      ],
    );
  }
}
