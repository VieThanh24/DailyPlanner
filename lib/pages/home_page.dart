import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kiem_tra_1/const/color.dart';
import 'package:kiem_tra_1/pages/add_note_screen.dart';
import 'package:kiem_tra_1/pages/calendar_screen.dart';
import 'package:kiem_tra_1/pages/navbar.dart';
import 'package:kiem_tra_1/pages/setting_screen.dart';
import 'package:kiem_tra_1/pages/tasklist_screen.dart';

import '../widget/stream_note.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

bool show = true;

class _Home_ScreenState extends State<Home_Screen> {
  // Chỉ mục hiện tại của trang đang được chọn
  int _selectedIndex = 0;

  // Danh sách các trang trong BottomNavigationBar
  final List<Widget> _pages = [
    // Trang Home
    Column(
      children: [
        Stream_note(false),
        Text(
          'isDone',
          style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold),
        ),
        Stream_note(true),
      ],
    ),
    // Trang Task (bạn có thể thay bằng một Widget khác cho trang này)
    Center(child: TaskStatisticsScreen()),
    // Trang Calendar
    Center(child: CalendarView()),
    // Trang Setting
    Center(child: SettingScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Planner'),
        centerTitle: true,
        backgroundColor: custom_green,
      ),
      bottomNavigationBar: NavigationBar(
        // Chỉ định chỉ mục hiện tại
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.task), label: "Task"),
          NavigationDestination(
              icon: Icon(Icons.calendar_month), label: "Calendar"),
          NavigationDestination(icon: Icon(Icons.settings), label: "Setting"),
        ],
      ),
      backgroundColor: backgroundColor,
      floatingActionButton: Visibility(
        visible: show,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Add_screen(),
            ));
          },
          backgroundColor: custom_green,
          child: Icon(Icons.add, size: 30),
        ),
      ),
      body: SafeArea(
        child: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              setState(() {
                show = true;
              });
            }
            if (notification.direction == ScrollDirection.reverse) {
              setState(() {
                show = false;
              });
            }
            return true;
          },
          child: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
        ),
      ),
    );
  }
}
