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
          crossAxisExtent: 100, // Breite eines Elements
          crossAxisSpacing: 8, // Abstand zwischen den Elementen
          mainAxisSpacing: 8, // Vertikaler Abstand zwischen den Reihen
        ),
        itemCount: 21, // Anzahl der Container
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color:
                _getRandomColor(), // Funktion zum Abrufen einer zufälligen Farbe
            height: 50,
            width: 100,
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
