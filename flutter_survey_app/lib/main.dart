import 'package:flutter/material.dart';
import 'package:flutter_survey_app/home.dart';

void main() {
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(title:new Text('Flutter.su')),
        body: new Text('Hello World!')
      )
    )
  );
}

// class SurveyApp extends StatelessWidget {
//   const SurveyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const HomePage(),
//       },
//     );
//   }
// }