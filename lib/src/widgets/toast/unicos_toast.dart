import 'package:flutter/material.dart';

import 'unicos_toast_view.dart';

class UnicosToast {
  static OverlayEntry? _toastEntry;
  static GlobalKey<UnicosToastViewState>? _key;

  static void show(
      {required BuildContext context,
      required UnicosToastType type,
      required String message}) {
    if (_toastEntry == null) {
      _key = GlobalKey<UnicosToastViewState>();
      _toastEntry = OverlayEntry(
        builder: (context) {
          return UnicosToastView(
            key: _key,
            onHide: () {
              _toastEntry?.remove();
              _toastEntry = null;
              _key = null;
            },
          );
        },
      );
      Overlay.of(context).insert(_toastEntry!);
    }

    if (_key?.currentState == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _key?.currentState?.add(type: type, message: message);
      });
    } else {
      _key?.currentState?.add(type: type, message: message);
    }
  }
}

enum UnicosToastType {
  error(Color(0xFFFF3F40)),
  warning(Color(0xFFFFBB54)),
  success(Color(0xFF00A389)),
  notice(Color(0xFF58CDFF));

  final Color color;

  const UnicosToastType(this.color);
}

extension UnicosToastExt on StatelessWidget {
  void showSuccess(BuildContext context, String message) {
    UnicosToast.show(
      context: context,
      type: UnicosToastType.success,
      message: message,
    );
  }

  void showError(BuildContext context, String message) {
    UnicosToast.show(
      context: context,
      type: UnicosToastType.error,
      message: message,
    );
  }
}
