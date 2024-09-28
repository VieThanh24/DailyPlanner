import 'package:flutter/material.dart';
import 'package:kiem_tra_1/pages/login_page.dart';
import 'package:kiem_tra_1/pages/signup_page.dart';

class Auth_Page extends StatefulWidget {
  const Auth_Page({super.key});

  @override
  State<Auth_Page> createState() => _Auth_PageState();
}

class _Auth_PageState extends State<Auth_Page> {
  bool a = true;
  void to() {
    setState(() {
      a = !a;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (a) {
      return LoginPage(to);
    } else {
      return SignUpPage(to);
    }
  }
}
