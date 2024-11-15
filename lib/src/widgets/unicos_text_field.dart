import 'package:flutter/material.dart';

import '../themes/themes.dart';

class UnicosTextField extends FormField<String> {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? label;
  final FocusNode? focusNode;

  UnicosTextField({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.label,
    this.focusNode,
    super.validator,
    this.controller,
  }) : super(
          builder: (state) => _UnicosTextField(
            state: state,
            controller: controller,
            hintText: hintText,
            obscureText: obscureText,
            prefixIcon: prefixIcon,
            label: label,
            focusNode: focusNode,
          ),
        );
}

class _UnicosTextField extends StatefulWidget {
  final FormFieldState<String> state;
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? label;
  final FocusNode? focusNode;

  const _UnicosTextField({
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.label,
    this.focusNode,
    required this.state,
  });

  @override
  State<_UnicosTextField> createState() => _UnicosTextFieldState();
}

class _UnicosTextFieldState extends State<_UnicosTextField> {
  FocusNode? _focusNode;
  TextEditingController? _controller;

  bool get hasFocus => _focusNode?.hasFocus ?? false;

  @override
  void initState() {
    super.initState();
    _setFocusNode();
    _setController();
  }

  @override
  void didUpdateWidget(covariant _UnicosTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setFocusNode();
    _setController();
  }

  void _setFocusNode() {
    _focusNode?.removeListener(_listenerFocus);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode?.addListener(_listenerFocus);
  }

  void _setController() {
    _controller?.removeListener(_listenerController);
    _controller = widget.controller ?? TextEditingController();
    _controller?.addListener(_listenerController);
    _listenerController();
  }

  void _listenerFocus() {
    setState(() {});
  }

  void _listenerController() {
    // ignore: invalid_use_of_protected_member
    widget.state.setValue(_controller?.text);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<UnicosTextFiledTheme>();
    final errorText = widget.state.errorText;
    final hasError = errorText?.isNotEmpty ?? false;
    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme?.errorBorderColor ?? Colors.black,
      ),
      borderRadius: BorderRadius.circular(8),
    );
    final focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme?.focusedBorderColor ?? Colors.black,
      ),
      borderRadius: BorderRadius.circular(8),
    );
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: theme?.borderColor ?? Colors.black,
      ),
      borderRadius: BorderRadius.circular(8),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: widget.label?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              widget.label ?? '',
              style: const TextStyle(
                color: Color(0xFF464255),
                fontSize: 12,
              ),
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: hasFocus
                ? [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.1),
                      offset: const Offset(0, 7),
                      blurRadius: 9,
                    )
                  ]
                : null,
          ),
          child: TextField(
            controller: widget.controller,
            style: theme?.style,
            focusNode: _focusNode,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              hintText: widget.hintText,
              fillColor: Colors.white,
              filled: true,
              focusColor: Colors.white,
              hoverColor: Colors.white,
              hintStyle: theme?.hintStyle,
              isDense: true,
              prefixIcon: widget.prefixIcon == null
                  ? null
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: widget.prefixIcon,
                    ),
              prefixIconConstraints: const BoxConstraints(),
              contentPadding: const EdgeInsets.all(16),
              border: hasError ? errorBorder : border,
              enabledBorder: hasError ? errorBorder : border,
              focusedBorder: hasError ? errorBorder : focusedBorder,
              focusedErrorBorder: errorBorder,
              errorBorder: errorBorder,
            ),
          ),
        ),
        Visibility(
          visible: errorText?.isNotEmpty ?? false,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              errorText ?? '',
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFFFF5B5B),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
