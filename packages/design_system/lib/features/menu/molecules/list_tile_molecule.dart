import 'package:design_system/features/menu/atoms/tile_leading_icon_atom.dart';
import 'package:design_system/shared/atoms/text_atom.dart';
import 'package:flutter/material.dart';

class ListTileMolecule extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData leadingIconData;
  final void Function()? onTapTile;

  const ListTileMolecule({
    super.key,
    required this.title,
    this.subtitle,
    required this.leadingIconData,
    this.onTapTile,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TileLeadingIconAtom(iconData: leadingIconData),
      title: TextAtom(title),
      subtitle: (subtitle != null) ? TextAtom(subtitle!) : null,
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: onTapTile,
    );
  }
}
