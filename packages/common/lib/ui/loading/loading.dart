import 'package:flutter/material.dart';

import '../../consts/color_palette.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  LoadingWidget({this.color = ColorPalette.primary});
  @override
  Widget build(BuildContext context) => CircularProgressIndicator(color: color);
}
