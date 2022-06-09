import 'package:common/consts/color_palette.dart';
import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text title({TextStyle? style}) {
    final defaultStyle = TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: ColorPalette.background);
    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text description({TextStyle? style}) {
    final defaultStyle = TextStyle(
        height: 1.5,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ColorPalette.primary);
    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }

  Text button({TextStyle? style}) {
    final defaultStyle = TextStyle(
        height: 1.5,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ColorPalette.aux);
    return Text(data!,
        style: (this.style ?? defaultStyle).merge(style ?? defaultStyle));
  }
}
