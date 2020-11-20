import 'package:flutter/material.dart';
import 'package:learners_1/Core/matrix/matrixMulProve.dart';
import 'package:learners_1/Core/matrixList.dart';

import 'home.dart';

void main() {
  runApp(Learners());
}

Map<String, Widget Function(BuildContext)> routes = {
  '/': (_) => HomePage(),
  '/Matrix': (_) => Matrix(),
  '/MatMulProve': (_) => MatrixMulProve()
};

class Learners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learners Digital',
      theme: ThemeData(
          accentColor: Colors.deepPurpleAccent,
          primaryColor: Colors.deepPurpleAccent,
          fontFamily: 'ProductSans'),
      initialRoute: '/',
      routes: routes,
    );
  }
}
