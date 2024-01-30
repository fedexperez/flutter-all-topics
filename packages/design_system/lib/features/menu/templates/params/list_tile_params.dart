import 'package:flutter/material.dart';

class ListTileParams {
  final String title;
  final String? subtitle;
  final IconData leadingIconData;
  final void Function()? onTapTile;

  ListTileParams({
    required this.title,
    required this.subtitle,
    required this.leadingIconData,
    required this.onTapTile,
  });
}
