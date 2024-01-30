import 'package:design_system/features/menu/templates/params/list_tile_params.dart';
import 'package:design_system/features/menu/molecules/list_tile_molecule.dart';
import 'package:flutter/material.dart';

class MenuListOrganism extends StatelessWidget {
  final List<ListTileParams> tiles;

  const MenuListOrganism({super.key, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tiles.length,
      itemBuilder: (BuildContext context, int index) {
        final item = tiles[index];
        return ListTileMolecule(
          title: item.title,
          subtitle: item.subtitle,
          leadingIconData: item.leadingIconData,
          onTapTile: item.onTapTile,
        );
      },
    );
  }
}
