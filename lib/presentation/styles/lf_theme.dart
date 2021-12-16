import 'package:flutter/material.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFTheme {
  static final ThemeData theme = ThemeData(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    tooltipTheme: const TooltipThemeData(
      decoration: BoxDecoration(color: Colors.transparent),
    ),
    dividerTheme: const DividerThemeData(color: LFColors.primaryDark),
  );
}
