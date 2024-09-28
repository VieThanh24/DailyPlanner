import 'package:flutter/material.dart';
import 'package:kiem_tra_1/const/color.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(''),
            accountEmail: const Text('@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/profile.png'),
              ),
            ),
            decoration: BoxDecoration(
              color: custom_green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Task'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            title: Text('Calendar'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
