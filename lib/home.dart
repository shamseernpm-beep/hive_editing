import 'package:edit_hive/model/student_model.dart';
import 'package:edit_hive/serviece/studeent_serviece.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'add.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Box<StudentModel> studentbox = Hive.box<StudentModel>("List");
  final service = StudeentServiece();
  int? editIndex;

  void navi() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: studentbox.listenable(),
        builder: (context, box, child) {
          final students = service.valueList();
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text(
                  "Age: ${student.age.toString()}                 Class: ${student.classs}",
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AddPage(student: student, index: index),
                          ),
                        );
                        editIndex = index;
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () async {
                        await service.delete(index);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navi();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
