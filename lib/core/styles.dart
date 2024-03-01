import 'package:flutter/material.dart';

InputDecoration customDecoration(
  String hintText,
  String labelText,
) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
    fillColor: Colors.white,
    filled: true,
    hintText: hintText,
    // prefixIcon:_showVisitorWidget? icon :Text(),
    counterText: "",

    hintStyle: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(10),
    //   borderSide: BorderSide(color: Colors.grey),
    // ),
    // enabledBorder: OutlineInputBorder(
    //   borderSide: BorderSide(
    //     color: Colors.grey,
    //     width: 0.0,
    //   ),
    //   borderRadius: BorderRadius.circular(10),
    // ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.blueGrey),
    ),
  );
}

class TextStyles {
  static TextStyle heading1 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading2 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heading3 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body1 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );

  static TextStyle body2 = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static TextStyle body3 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}
