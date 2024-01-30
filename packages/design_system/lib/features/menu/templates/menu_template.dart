import 'package:flutter/material.dart';

import 'package:design_system/features/menu/organisms/menu_list_organism.dart';
import 'package:design_system/features/menu/templates/params/list_tile_params.dart';
import 'package:design_system/shared/atoms/app_bar_atom.dart';

class MenuTemplate extends StatelessWidget {
  final String title;
  final List<ListTileParams> listTiles;

  const MenuTemplate({
    super.key,
    required this.title,
    required this.listTiles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAtom.transparent(title: title),
      body: SafeArea(
        child: MenuListOrganism(tiles: listTiles),
      ),
    );
  }
}
