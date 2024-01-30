import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:design_system/features/internationalization/atoms/radio_list_tile_atom.dart';

void main() {
  group('RadioListTileAtom', () {
    testWidgets('should create RadioListTileAtom without errors',
        (tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RadioListTileAtom(
              value: true,
              groupValue: false,
              onChanged: (value) {},
              title: const Text('Sample Radio Tile'),
            ),
          ),
        ),
      );

      // Act & Assert
      expect(find.byType(RadioListTileAtom), findsOneWidget);
    });
  });
}
