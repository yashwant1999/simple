import 'package:flutter/material.dart';

class Scrim extends StatelessWidget {
  final double height;
  final double opacity;

  const Scrim({super.key, this.height = double.infinity, this.opacity = 0.5});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(opacity), Colors.transparent],
        ),
      ),
    );
  }
}
