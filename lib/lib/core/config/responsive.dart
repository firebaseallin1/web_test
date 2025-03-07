import 'package:flutter/material.dart';

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Responsive UI")),
      body: Center(
        child: Container(
          width: screenWidth * 0.8,  // 80% of screen width
          height: screenHeight * 0.2, // 20% of screen height
          color: Colors.blue,
          child: Center(child: Text("Responsive Box", style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
