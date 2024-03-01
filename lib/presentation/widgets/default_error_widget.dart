import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  final String message;

  const DefaultErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
