import 'package:flutter/material.dart';

class Style {
  static final baseTextStyle = const TextStyle(fontFamily: 'Barlow');
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xFF1F4141),
      fontSize: 14.0,
      fontWeight: FontWeight.w400);
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 18.0,
      height: 1.0,
      fontWeight: FontWeight.w600);
  static final subTitleTextStyle = baseTextStyle.copyWith(
      color: Colors.black54,
      fontSize: 18.0,
      height: 1.1,
      fontWeight: FontWeight.w500);
  static final headerTextStyle = baseTextStyle.copyWith(
      color: const Color(0xFF152929),
      fontSize: 20.0,
      height: 1.2,
      fontWeight: FontWeight.w400);
}
