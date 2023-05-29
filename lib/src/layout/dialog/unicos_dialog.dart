import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class UnicosDialog extends StatelessWidget {
  final String? title;
  final String message;
  final String? btnTextOK;
  final String? btnTextCancel;

  const UnicosDialog({
    super.key,
    this.title,
    required this.message,
    this.btnTextOK,
    this.btnTextCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width > 400
            ? 400
            : MediaQuery.of(context).size.width,
        child: UnicosCard(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 29),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Text(
                    title ?? '',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF464255),
                    ),
                  ),
                ),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF464255),
                ),
              ),
              _buildButtonBar(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    if (btnTextCancel == null && btnTextOK == null) {
      return const SizedBox.shrink();
    }

    if (btnTextCancel != null && btnTextOK != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UnicosButton.label(
              label: btnTextCancel!,
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 39,
              ),
              color: const Color(0xFFFF5B5B),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            const SizedBox(width: 20),
            UnicosButton.label(
              label: btnTextOK!,
              color: const Color(0xFF00A389),
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 39,
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: UnicosButton.label(
        label: btnTextOK ?? btnTextCancel ?? '',
        color: const Color(0xFF4A52FF),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  factory UnicosDialog.confirm({
    required String message,
    String? title,
    required String btnTextOK,
    required String btnTextCancel,
  }) {
    return UnicosDialog(
      message: message,
      title: title,
      btnTextCancel: btnTextCancel,
      btnTextOK: btnTextOK,
    );
  }
}

extension UnicosDialogExt on StatelessWidget {
  Future<bool?> showConfirm(
    BuildContext context, {
    required String message,
    String? title,
    required String btnTextOK,
    required String btnTextCancel,
  }) {
    return showDialog<bool>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) => UnicosDialog.confirm(
        message: message,
        title: title,
        btnTextCancel: btnTextCancel,
        btnTextOK: btnTextOK,
      ),
    );
  }
}
