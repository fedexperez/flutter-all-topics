import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:design_system/features/menu/templates/menu_template.dart';
import 'package:design_system/features/menu/templates/params/list_tile_params.dart';
import 'package:flutter_all_topics/core/constants/router_paths.dart';
import 'package:flutter_all_topics/core/l10n/generated/l10n.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuTemplate(
      title: L10n.of(context).flutterAllTopics,
      listTiles: [
        ListTileParams(
          title: L10n.of(context).language,
          subtitle: null,
          leadingIconData: Icons.language_rounded,
          onTapTile: () => context.push(RouterPaths.language),
        ),
        ListTileParams(
          title: L10n.of(context).restApi,
          subtitle: null,
          leadingIconData: Icons.data_object_rounded,
          onTapTile: () => context.push(RouterPaths.rest),
        ),
      ],
    );
  }
}
