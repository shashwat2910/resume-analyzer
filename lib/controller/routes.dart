import 'package:get/get.dart';
import 'package:major_project/views/dashboard.dart';
import 'package:major_project/views/forget_password.dart';
import 'package:major_project/views/home_screen.dart';
import 'package:major_project/views/resume_builder.dart';
import 'package:major_project/views/signup_page.dart';
import 'package:major_project/views/testing.dart';
import 'package:major_project/views/user_profile.dart';
import '../hr/hr_addjob.dart';
import '../hr/hr_dashboard.dart';
import '../hr/loginPage.dart';
import '../hr/signPage.dart';
import '../views/login_page.dart';

appRoutes() => [
      GetPage(
        name: '/',
        page: () => HomeScreen(),
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/hr/login',
        page: () => HRLoginPage(),
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/hr/signup',
        page: () => HRSignUpPage(),
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/login',
        page: () => LoginPage(),
        transitionDuration: Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/forgotpassword',
        page: (() => ForgetPassword()),
      ),
      GetPage(
        name: '/signup',
        page: () => SignUpPage(),
      ),
      GetPage(
        name: '/hr/dashboard',
        page: (() => HRDashboard()),
      ),
      GetPage(
        name: '/hr/addJob',
        page: (() => HRJob()),
      ),
      GetPage(
        name: '/dashboard',
        page: (() => DashBoardScreen()),
      ),
      GetPage(
        name: '/profile',
        page: (() => UserProfile()),
      ),
      GetPage(
        name: '/resume-builder',
        page: (() => ResumeBuilder()),
      ),
      GetPage(
        name: '/testing',
        page: (() => TestingPage()),
      ),
    ];
