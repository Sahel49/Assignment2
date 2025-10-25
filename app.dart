

import 'package:assignment_2/home.dart';
import 'package:flutter/material.dart';
import 'package:assignment_2/app.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Ostad",
      home: HomePage(),


    );
  }
}
