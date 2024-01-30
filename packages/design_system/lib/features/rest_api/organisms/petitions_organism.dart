import 'package:design_system/features/rest_api/molecules/list_tile_molecule.dart';
import 'package:design_system/features/rest_api/templates/params/petition_tile_params.dart';
import 'package:flutter/material.dart';

class PetitionListOrganism extends StatelessWidget {
  final List<PetitionTileParams> petitionListParams;

  const PetitionListOrganism({
    super.key,
    required this.petitionListParams,
  });

  @override
  Widget build(BuildContext context) {
    return PetitionListMolecule(
      buttons: petitionListParams,
    );
  }
}
