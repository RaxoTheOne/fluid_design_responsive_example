import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive GridView'),
      ),
      body: ResponsiveGridView.builder(
        alignment: Alignment.center,
        gridDelegate: const ResponsiveGridDelegate(
          crossAxisExtent: 80,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 48,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: _getRandomColor(),
            height: 100,
            width: 150,
            child: Center(
              child: Text('Farbe $index'),
            ),
          );
        },
      ),
    );
  }

  // Funktion zum Abrufen einer zufälligen Farbe
  Color _getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
