import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final int days =80;
  final String name = "Jayneel Kanungo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
        child: Container(
            child: Text("Welcome to ${days+10} Days of Flutter with $name")
        ),
      ),
      drawer: Drawer(),
    );
  }
}
