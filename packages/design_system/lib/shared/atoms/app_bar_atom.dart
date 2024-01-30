import 'package:flutter/material.dart';

class AppBarAtom extends AppBar {
  AppBarAtom.transparent({
    super.key,
    required String title,
  }) : super(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(title),
        );
}
