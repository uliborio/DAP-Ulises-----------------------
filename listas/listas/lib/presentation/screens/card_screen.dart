import 'package:flutter/material.dart';
import 'package:projecto2/core/app/entities/Post.dart';

class CardScreen extends StatelessWidget {
  final List<Post> list;
  final int pressed;

  const CardScreen({super.key, required this.list, required this.pressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[pressed].title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              list[pressed].imagesrc,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(
              list[pressed].title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  list[pressed].text,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
