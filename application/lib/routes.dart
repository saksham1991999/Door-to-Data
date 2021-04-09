import 'package:doortodata/pages/blog/blog_screen.dart';
import 'package:doortodata/pages/onboarding/login_screen.dart';
import 'package:doortodata/pages/onboarding/signup_screen.dart';
import 'package:doortodata/pages/onboarding/welcome_screen.dart';
import 'package:get/route_manager.dart';
import './pages/home/home.dart';
import 'pages/profile/my_profile.dart';

routes() => [
  GetPage(name: "/", page: () => HomeScreen()),
  GetPage(name: "welcome/", page: () => WelcomeScreen()),
  GetPage(name: "login/", page: () => LoginScreen()),
  GetPage(name: "signup/", page: () => SignUpScreen()),
  GetPage(name: "profile/", page: () => HomeScreen()),
  GetPage(name: "facts/", page: () => BlogsScreen()),
  GetPage(name: "facts/:id", page: () => HomeScreen()),
  GetPage(name: "account_profile/", page: () => MyProfile()),
  GetPage(name: "contactUs/", page: () => HomeScreen()),
  GetPage(name: "change_password/", page: () => HomeScreen()),
];