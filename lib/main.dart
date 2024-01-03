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
    double maxCrossAxisExtent = _calculateMaxCrossAxisExtent(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive GridView'),
      ),
      body: ResponsiveGridView.builder(
        alignment: Alignment.center,
        gridDelegate: ResponsiveGridDelegate(
          crossAxisExtent: 80,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          maxCrossAxisExtent: maxCrossAxisExtent,
        ),
        itemCount: 48,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: _getRandomColor(),
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

  // Funktion zum Berechnen der maximalen Breite jedes Elements basierend auf der Bildschirmbreite
  double _calculateMaxCrossAxisExtent(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double maxCrossAxisExtent;

    if (screenWidth > 1200) {
      maxCrossAxisExtent = screenWidth / 6;
    } else if (screenWidth > 900) {
      maxCrossAxisExtent = screenWidth / 5;
    } else if (screenWidth > 600) {
      maxCrossAxisExtent = screenWidth / 4;
    } else if (screenWidth > 400) {
      maxCrossAxisExtent = screenWidth / 3;
    } else {
      maxCrossAxisExtent = screenWidth / 2;
    }

    return maxCrossAxisExtent;
  }
}
