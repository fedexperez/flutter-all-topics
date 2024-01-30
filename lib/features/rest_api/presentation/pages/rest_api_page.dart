import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';
import 'package:flutter_all_topics/features/rest_api/presentation/bloc/rest_api_bloc.dart';
import 'package:design_system/features/rest_api/templates/params/petition_tile_params.dart';
import 'package:design_system/features/rest_api/templates/rest_api_template.dart';
import 'package:design_system/features/rest_api/molecules/response_alert_dialog_molecule.dart';

class RestApiPage extends StatelessWidget {
  const RestApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RestApiBloc, RestApiState>(
      listener: (context, state) {
        if (state is RestApiErrorState) {
          showDialog(
            context: context,
            builder: (_) => ResponseAlertDialogMolecule(
              title: L10n.of(context).apiResponseTitle,
              responseType: '',
              message: state.message,
              statusCode: '',
              closeButtonText: L10n.of(context).close,
            ),
          );
        } else if (state is RestApiPetitionCompletedState) {
          showDialog(
            context: context,
            builder: (_) => ResponseAlertDialogMolecule(
              title: L10n.of(context).apiResponseTitle,
              responseType: state.responseType,
              message: state.message,
              statusCode: state.statusCode,
              closeButtonText: L10n.of(context).close,
            ),
          );
        }
      },
      builder: (context, state) {
        return RestApiTemplate(
          title: L10n.of(context).restApi,
          petitionListParams: [
            PetitionTileParams(
              label: 'GET',
              onTap: () => context
                  .read<RestApiBloc>()
                  .add(const RestApiMakeGetEvent(type: 'GET')),
            ),
            PetitionTileParams(
              label: 'POST',
              onTap: () => context
                  .read<RestApiBloc>()
                  .add(const RestApiMakePostEvent(type: 'POST')),
            ),
            PetitionTileParams(
              label: 'DELETE',
              onTap: () => context
                  .read<RestApiBloc>()
                  .add(const RestApiMakeDeleteEvent(type: 'DELETE')),
            ),
            PetitionTileParams(
              label: 'PUT',
              onTap: () => context
                  .read<RestApiBloc>()
                  .add(const RestApiMakePutEvent(type: 'PUT')),
            ),
            PetitionTileParams(
              label: 'PATCH',
              onTap: () => context
                  .read<RestApiBloc>()
                  .add(const RestApiMakePatchEvent(type: 'PATCH')),
            ),
          ],
        );
      },
    );
  }
}
