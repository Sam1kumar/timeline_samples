import 'package:flutter/material.dart';
import 'package:timeline_samples/widgets/timelines.dart';

void main() {
  runApp(MaterialApp(home: Timelines()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Timelines())),
      ),
    );
  }
}
