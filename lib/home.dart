import 'package:flutter/material.dart';

import 'add.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void navi() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navi();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
