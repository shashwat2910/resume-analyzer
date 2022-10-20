import 'package:flutter/material.dart';
import '../widgets/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AppBarScreen(),
            SizedBox(
              height: 15,
            ),
            FirstWidget(),
            SizedBox(
              height: 15,
            ),
            SecondWidget(),
            SizedBox(
              height: 15,
            ),
            ThirdWidget()
          ],
        ),
      ),
    );
  }
}

