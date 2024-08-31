import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late Box box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  //1- open box
                  box = await Hive.openBox("putBox");
                },
                child: const Text("Open Box")),
            ElevatedButton(
                onPressed: () {
                  //2- Put data in box
                  box.putAt(0, "Karim");
                  box.putAt(1, 21);
                },
                child: const Text("Put Data in Box")),
            ElevatedButton(
                onPressed: () {
                  //3- Print data from box
                  log(box.get("name").toString());
                  log(box.get("age").toString());
                },
                child: const Text("Display Data")),
          ],
        ),
      ),
    );
  }
}
