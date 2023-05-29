import 'package:flutter/material.dart';

import 'unicos_toast.dart';
import 'unicos_toast_item.dart';
import 'unicos_toast_view_model.dart';

class UnicosToastView extends StatefulWidget {
  final void Function()? onHide;

  const UnicosToastView({
    super.key,
    this.onHide,
  });

  @override
  State<StatefulWidget> createState() => UnicosToastViewState();
}

class UnicosToastViewState extends State<UnicosToastView>
    with SingleTickerProviderStateMixin {
  final _keyAnimatedList = GlobalKey<AnimatedListState>();
  List<UnicosToastViewModel> listToast = List.empty(growable: true);

  late final AnimationController _aniController;
  late final Animation<Offset> _animation;
  bool _isReversing = false;

  @override
  void initState() {
    super.initState();

    _aniController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: const Offset(0, 0),
    ).animate(_aniController);

    _aniController.addListener(() {
      if (_aniController.isAnimating) {
        setState(() {});
        return;
      }

      if (_isReversing) {
        _isReversing = false;
        widget.onHide?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Positioned(
      top: 0,
      right: width < 300 ? null : 0,
      left: width < 300 ? 0 : null,
      child: SlideTransition(
        position: _animation,
        child: Material(
          color: Colors.transparent,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300,
              maxHeight: MediaQuery.of(context).size.height,
              minWidth: 100,
            ),
            child: AnimatedList(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              key: _keyAnimatedList,
              itemBuilder: (ctx, index, ani) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1, 0),
                    end: const Offset(0, 0),
                  ).animate(ani),
                  child: UnicosToastItem(
                    viewModel: listToast[index],
                    separator: EdgeInsets.only(
                        bottom: index == listToast.length - 1 ? 0 : 10),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void add({required UnicosToastType type, required String message}) {
    listToast.insert(
      0,
      UnicosToastViewModel(type: type, message: message),
    );

    if (listToast.length == 1) {
      _keyAnimatedList.currentState?.insertItem(0, duration: Duration.zero);
      _aniController.forward();
    } else {
      _keyAnimatedList.currentState?.insertItem(0);
    }

    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (listToast.length <= 1) {
        _aniController.reverse();
        _isReversing = true;
        return;
      }

      final viewModel = listToast.removeLast();
      _keyAnimatedList.currentState?.removeItem(
        listToast.length,
        (context, ani) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(ani),
          child: UnicosToastItem(
            viewModel: viewModel,
            separator: const EdgeInsets.only(top: 10),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _aniController.dispose();
    super.dispose();
  }
}
