import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final usernamController = TextEditingController();
  final ageController = TextEditingController();
  final classController = TextEditingController();

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
                hintText: "enter your class",
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},

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
