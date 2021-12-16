import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool enabled;

  const LFButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: enabled ? onPressed : null,
        child: Text(text, style: _textStyle()),
        style: _buttonStyle(),
      );

  TextStyle _textStyle() => TextStyle(
        color: LFColors.secondary,
        fontSize: 32.sp,
        fontWeight: FontWeight.w500,
      );

  ButtonStyle _buttonStyle() => ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 80.w),
        primary: LFColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      );
}
