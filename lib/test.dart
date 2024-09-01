import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_1/person_class/person.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late Box _box;

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
                  _box = await Hive.openBox("adabpterBox");
                },
                child: const Text("Open Box")),
            ElevatedButton(
                onPressed: () {
                  //2- Add data in box
                  _box.put(
                    0,
                    _get(),
                  );
                },
                child: const Text("Add Data in Box")),
            ElevatedButton(
                onPressed: () {
                  //3- Print data from box
                  Person person = _box.get(0);
                   log(person.name.toString());
                   log(person.age.toString());
                   log(person.friends[0].name.toString());
                },
                child: const Text("Display Data")),
          ],
        ),
      ),
    );
  }

  Person _get() => Person(name: "Karim", age: 22, friends: [
        Person(
          name: "Mahmoud",
          age: 23,
          friends: [
            Person(
              name: "Ahmed",
              age: 24,
              friends: [],
            ),
            Person(
              name: "Omar",
              age: 22,
              friends: [],
            ),
          ],
        ),
      ]);
}
