import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final String hintText;
  final bool obscureText;
  final int linesCount;

  const LFTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.hintText,
    this.obscureText = false,
    this.linesCount = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        style: _style(),
        decoration: _decoration(),
        cursorColor: LFColors.primary,
        minLines: linesCount,
        maxLines: linesCount,
      );

  TextStyle _style() => TextStyle(fontSize: 36.sp);

  InputDecoration _decoration() => InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 21.h, horizontal: 29.w),
        enabledBorder: _border(),
        focusedBorder: _border().copyWith(
          borderSide: _borderSide().copyWith(width: 3.r),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: LFColors.textHint),
      );

  InputBorder _border() => OutlineInputBorder(
        borderSide: _borderSide(),
        borderRadius: BorderRadius.circular(10.r),
      );

  BorderSide _borderSide() => BorderSide(color: LFColors.primary, width: 2.r);
}
