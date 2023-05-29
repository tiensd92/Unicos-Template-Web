import 'package:flutter/material.dart';

import 'unicos_menu_popup_view.dart';

class UnicosMenuPopup {
  static OverlayEntry? _popupEntry;
  static GlobalKey<UnicosMenuPopupViewState>? _key;

  static void show({
    required BuildContext context,
    required List<Widget> items,
    required RelativeRect position,
  }) {
    if (_popupEntry == null) {
      _key = GlobalKey<UnicosMenuPopupViewState>();
      _popupEntry = OverlayEntry(
        builder: (context) {
          return UnicosMenuPopupView(
            position: position,
            key: _key,
            onHide: () {
              _popupEntry?.remove();
              _popupEntry = null;
              _key = null;
            },
            items: items,
          );
        },
      );
      Overlay.of(context).insert(_popupEntry!);
      return;
    }

    _key?.currentState?.change(items: items);
  }

  static void hide() {
    _popupEntry?.remove();
  }
}

extension UnicosMenuPopupExt on StatelessWidget {
  void showMenuPopup(
    BuildContext context, {
    required List<Widget> items,
    required RelativeRect position,
  }) {
    UnicosMenuPopup.show(
      context: context,
      items: items,
      position: position,
    );
  }

  void hideMenuPopup() {
    UnicosMenuPopup.hide();
  }
}
