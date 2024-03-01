import 'package:flutter/material.dart';

class DefaultCircularWidget extends StatelessWidget {
  const DefaultCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
