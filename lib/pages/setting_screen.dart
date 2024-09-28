import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isDarkMode = false; // Biến lưu trạng thái Dark Mode
  bool _notificationsEnabled = true; // Biến lưu trạng thái Thông báo
  String _taskViewMode = 'List'; // Chế độ hiển thị công việc mặc định là List

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Cài đặt chế độ Dark Mode
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('Dark Mode'),
            trailing: Switch(
              value: _isDarkMode,
              onChanged: (bool value) {
                setState(() {
                  _isDarkMode = value;
                  // Chèn logic thay đổi chế độ sáng tối trong app tại đây nếu cần
                });
              },
            ),
          ),
          Divider(),

          // Cài đặt thông báo
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Enable Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                  // Chèn logic thay đổi trạng thái thông báo tại đây nếu cần
                });
              },
            ),
          ),
          Divider(),

          // Cài đặt chế độ hiển thị công việc
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Task View Mode'),
            subtitle: Text('Choose how tasks are displayed'),
            trailing: DropdownButton<String>(
              value: _taskViewMode,
              onChanged: (String? newValue) {
                setState(() {
                  _taskViewMode = newValue!;
                  // Chèn logic thay đổi chế độ hiển thị công việc tại đây nếu cần
                });
              },
              items: <String>['List', 'Grid']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Divider(),

          // Cài đặt reset dữ liệu
          ListTile(
            leading: Icon(Icons.restore),
            title: Text('Reset Data'),
            onTap: () {
              // Thêm logic reset dữ liệu tại đây
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Reset Data'),
                    content: Text('Are you sure you want to reset all data?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Đóng hộp thoại
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Thực hiện reset dữ liệu tại đây
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),

          // Thông tin phiên bản ứng dụng
          ListTile(
            leading: Icon(Icons.info),
            title: Text('App Version'),
            subtitle: Text('1.0.0'),
          ),
        ],
      ),
    );
  }
}
