import 'package:flutter/material.dart';

class TileLeadingIconAtom extends StatelessWidget {
  final IconData iconData;

  const TileLeadingIconAtom({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
