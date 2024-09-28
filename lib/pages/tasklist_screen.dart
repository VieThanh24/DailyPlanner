import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TaskStatisticsScreen extends StatelessWidget {
  const TaskStatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Statistics'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tiêu đề của biểu đồ
            const Text(
              'Task Completion Status',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Biểu đồ Pie Chart
            Expanded(
              child: PieChart(
                PieChartData(
                  sections: getSections(),
                  centerSpaceRadius: 60,
                  sectionsSpace: 2,
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),

            // Thống kê chi tiết các loại công việc
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                TaskStatItem(
                    label: 'Completed', value: 10, color: Colors.green),
                TaskStatItem(label: 'New', value: 5, color: Colors.blue),
                TaskStatItem(
                    label: 'In Progress', value: 3, color: Colors.orange),
                TaskStatItem(label: 'Overdue', value: 2, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Dữ liệu cho biểu đồ hình tròn
  List<PieChartSectionData> getSections() {
    return [
      PieChartSectionData(
        color: Colors.green,
        value: 10, // Số công việc hoàn thành
        title: '10',
        radius: 50,
        titleStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.blue,
        value: 5, // Số công việc mới tạo
        title: '5',
        radius: 50,
        titleStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.orange,
        value: 3, // Số công việc đang thực hiện
        title: '3',
        radius: 50,
        titleStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 2, // Số công việc trễ hạn
        title: '2',
        radius: 50,
        titleStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}

// Widget hiển thị thống kê từng loại công việc
class TaskStatItem extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const TaskStatItem({
    Key? key,
    required this.label,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          '$value Tasks',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
