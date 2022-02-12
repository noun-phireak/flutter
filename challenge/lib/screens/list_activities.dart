import 'package:challenge/screens/student.dart';
import 'package:flutter/material.dart';

class ListActivities extends StatelessWidget {
  const ListActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Student> students = [
      Student(1, 'Ly Lay'),
      Student(2, 'Noun Pheareak'),
      Student(3, 'Ly Lay'),
      Student(4, 'Noun Pheareak'),
      Student(5, 'Ly Lay'),
      Student(6, 'Noun Pheareak'),
      Student(7, 'Ly Lay'),
      Student(8, 'Noun Pheareak'),
      Student(9, 'Ly Lay'),
      Student(10, 'Noun Pheareak'),
      Student(11, 'Ly Lay'),
      Student(12, 'Noun Pheareak'),
      Student(13, 'Ly Lay'),
      Student(14, 'Noun Pheareak'),
      Student(15, 'Ly Lay'),
      Student(16, 'Noun Pheareak'),
      Student(17, 'Ly Lay'),
      Student(18, 'Noun Pheareak'),
    ];
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(students.length, (index) {
          return Card(
            elevation: 3.0,
            child: Text(students[index].name),
          );
        }));
  }
}
