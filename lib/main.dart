import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_1/person_class/person_type_adabter.dart';
import 'package:project_1/test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonTypeAdabter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      debugShowCheckedModeBanner: false,
      home:  TestView(),
    );
  }
}
