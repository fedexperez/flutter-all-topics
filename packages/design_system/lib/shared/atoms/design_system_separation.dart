import 'package:design_system/tokens/tokens.dart';
import 'package:flutter/material.dart';

class DesignSystemSeparation extends StatelessWidget {
  final double nSeparated;
  const DesignSystemSeparation({
    super.key,
    required this.nSeparated,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: nSeparated * DesignSystemSizes.sizeSM,
    );
  }
}
