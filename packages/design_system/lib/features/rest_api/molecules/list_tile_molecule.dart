import 'package:flutter/material.dart';

import 'package:design_system/features/rest_api/templates/params/petition_tile_params.dart';
import 'package:design_system/shared/atoms/text_atom.dart';
import 'package:design_system/features/rest_api/atoms/petition_tile_atom.dart';

class PetitionListMolecule extends StatelessWidget {
  final List<PetitionTileParams> buttons;

  const PetitionListMolecule({
    super.key,
    required this.buttons,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: buttons.map((params) {
        return PetitionTileAtom(
          title: TextAtom(params.label),
          onTap: params.onTap,
        );
      }).toList(),
    );
  }
}
