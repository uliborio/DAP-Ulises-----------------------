import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
           'Bienvenidos',
           style: TextStyle(fontSize: 38),
          ),
          SizedBox(height: 27),
          Text(
            'Hello world',
            style: TextStyle(fontSize: 30),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Usuario:',
            style: TextStyle(fontSize: 25, color: Colors.blue)
            
            )
          ],
        ) 
        ],
        ),
      ),
    ),
  );
  }
}
