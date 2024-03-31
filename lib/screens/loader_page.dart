import 'package:flutter/material.dart';

class CircularLoaderScreen extends StatelessWidget {
  const CircularLoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
