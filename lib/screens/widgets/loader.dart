import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.opacity = 0.5,
    this.dismissibles = false,
  });

  final double opacity;
  final bool dismissibles;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: opacity,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
