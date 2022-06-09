import 'package:common/ui/loading/loading.dart';
import 'package:flutter/material.dart';

import '../../consts/consts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? disabledColor;
  final bool loading;

  PrimaryButton(
      {required this.text,
      required this.onPressed,
      this.backgroundColor,
      this.disabledColor,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return disabledColor ?? ColorPalette.secondary;
          }
          return backgroundColor ?? ColorPalette.background;
        })),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: 46,
          child: loading ? LoadingWidget(color: ColorPalette.aux) : _text(),
        ));
  }

  Widget _text() => Text(text).button();
}
