import 'package:doortodata/pages/blog/blog_screen.dart';
import 'package:doortodata/pages/onboarding/login_screen.dart';
import 'package:doortodata/pages/onboarding/signup_screen.dart';
import 'package:doortodata/pages/onboarding/welcome_screen.dart';
import 'package:get/route_manager.dart';
import './pages/home/home.dart';

routes() => [
  GetPage(name: "/", page: () => HomeScreen()),
  GetPage(name: "welcome/", page: () => WelcomeScreen()),
  GetPage(name: "login/", page: () => LoginScreen()),
  GetPage(name: "signup/", page: () => SignUpScreen()),
  GetPage(name: "profile/", page: () => HomeScreen()),
  GetPage(name: "blog/", page: () => BlogsScreen()),
  GetPage(name: "blog/:id", page: () => HomeScreen()),
];