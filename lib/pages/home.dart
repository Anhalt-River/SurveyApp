import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home page")),
      body: Center(
          child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 900),
        reverseDuration: const Duration(milliseconds: 50),
        child: Text(
          "$_counter",
          key: ValueKey<int>(_counter),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.animation),
          onPressed: () {
            setState(() {
              _counter++;
            });
          }),
    );
  }
}
