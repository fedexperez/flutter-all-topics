import 'package:flutter/material.dart';

import 'package:design_system/features/rest_api/organisms/petitions_organism.dart';
import 'package:design_system/features/rest_api/templates/params/petition_tile_params.dart';
import 'package:design_system/shared/atoms/app_bar_atom.dart';

class RestApiTemplate extends StatelessWidget {
  final String title;
  final List<PetitionTileParams> petitionListParams;

  const RestApiTemplate({
    super.key,
    required this.title,
    required this.petitionListParams,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAtom.transparent(title: title),
      body: SafeArea(
        child: PetitionListOrganism(
          petitionListParams: petitionListParams,
        ),
      ),
    );
  }
}
