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
        gridDelegate: const ResponsiveGridDelegate(
          crossAxisExtent: 150, // Breite eines Elements
          crossAxisSpacing: 8,   // Abstand zwischen den Elementen
          mainAxisSpacing: 8,     // Vertikaler Abstand zwischen den Reihen
        ),
        alignment: Alignment.center,
        itemCount: 6,  // Anzahl der Container
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: _getColor(index), // Funktion zum Abrufen der Farbe
            height: 100,
            width: 150,
            child: Center(
              child: Text('Element $index'),
            ),
          );
        },
      ),
    );
  }

  // Funktion zum Abrufen der Farbe basierend auf dem Index
  Color _getColor(int index) {
    return index % 2 == 0 ? Colors.blue : Colors.green;
  }
}
