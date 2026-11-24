import 'package:edit_hive/model/student_model.dart';
import 'package:edit_hive/serviece/studeent_serviece.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddPage extends StatefulWidget {
  final StudentModel? student;
  final int? index;
  final int? editIndex;
  const AddPage({super.key, this.student, this.index, this.editIndex});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final Box<StudentModel> studentbox = Hive.box<StudentModel>("List");
  final service = StudeentServiece();
  int? editIndex;

  @override
  void initState() {
    super.initState();

    if (widget.student != null) {
      usernamController.text = widget.student!.name;
      ageController.text = widget.student!.age.toString();
      classController.text = widget.student!.classs;

      editIndex = widget.index;
    }
  }

  final usernamController = TextEditingController();
  final ageController = TextEditingController();
  final classController = TextEditingController();

  @override
  void dispose() {
    usernamController.dispose();
    ageController.dispose();
    classController.dispose();
    super.dispose();
  }

  void click() async {
    String username = usernamController.text;
    int age = int.tryParse(ageController.text) ?? 0;
    String classs = classController.text;

    if (username.isEmpty || age.toString().isEmpty || classs.isEmpty) {
      return;
    }

    StudentModel student = StudentModel(
      name: username,
      age: age,
      classs: classs,
    );

    if (editIndex == null) {
      await service.addData(student);
    } else {
      await service.update(editIndex!, student);
      editIndex = null;
    }

    usernamController.clear();
    ageController.clear();
    classController.clear();

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernamController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your name",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your age",
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: classController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter your class  ",
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  click();
                },

                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                ),
                child: Text("SUBMIT"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
