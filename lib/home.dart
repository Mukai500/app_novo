import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Home"),
        actions: [Icon(Icons.abc)],
      ),
      body: Container(
          child: Column(
        children: [
          Card(
            color: Colors.amber,
          )
        ],
      )),
    );
  }
}
