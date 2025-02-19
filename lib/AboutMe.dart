import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {
  AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //     // title: const Text("Next Page"),
      //     ),
      body: Center(
        child: Text("This is the next page!"),
      ),
    );
  }
}
