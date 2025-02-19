import 'package:flutter/material.dart';

class MyProjectsScreens extends StatelessWidget {
  MyProjectsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Next Page"),
      ),
      body: Center(
        child: Text("This is the next page!"),
      ),
    );
  }
}
