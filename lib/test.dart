import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

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
                  await Hive.openBox("testBox");
                },
                child: const Text("Open Box")),
            ElevatedButton(
                onPressed: () {
                  //2- access box
                  Box box = Hive.box("testBox");
                },
                child: const Text("Access Box")),
          ],
        ),
      ),
    );
  }
}
