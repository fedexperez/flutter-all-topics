import 'package:flutter/material.dart';

import 'package:design_system/shared/atoms/text_atom.dart';

class ResponseAlertDialogMolecule extends StatelessWidget {
  final String title;
  final String responseType;
  final String message;
  final String statusCode;
  final String closeButtonText;

  const ResponseAlertDialogMolecule({
    super.key,
    required this.responseType,
    required this.title,
    required this.message,
    required this.statusCode,
    required this.closeButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextAtom(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextAtom(responseType),
            TextAtom(message),
            TextAtom(statusCode),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(closeButtonText),
        ),
      ],
    );
  }
}
