import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(color: Color(0xFFF5F5F5))),
      home: Scaffold(
        body: ResponsiveGridView.builder(
          gridDelegate: ResponsiveGridDelegate(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) => Container(
            alignment: Alignment.center,
            color: Colors.blue[(index+1)*100],
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
