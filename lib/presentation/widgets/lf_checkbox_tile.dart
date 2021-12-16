import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFCheckboxTile extends StatelessWidget {
  final bool value;
  final void Function(bool?) onChanged;
  final String title;

  const LFCheckboxTile({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CheckboxListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title, style: TextStyle(fontSize: 24.sp)),
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        checkColor: LFColors.secondary,
        activeColor: LFColors.primary,
      );
}
