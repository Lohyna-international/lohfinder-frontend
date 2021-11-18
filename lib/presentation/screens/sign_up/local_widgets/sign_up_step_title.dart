import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class SignUpStepTitle extends StatelessWidget {
  final int stepNumber;
  final String titleText;

  const SignUpStepTitle({
    required this.stepNumber,
    required this.titleText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _stepNumber(),
          SizedBox(width: 31.w),
          _titleText(),
        ],
      );

  Widget _stepNumber() => Container(
        alignment: Alignment.center,
        height: 100.r,
        width: 100.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 5.r, color: LFColors.primary),
        ),
        child: Text(
          stepNumber.toString(),
          style: _textStyle().copyWith(color: LFColors.primary),
        ),
      );

  Widget _titleText() => Text(
        titleText,
        style: _textStyle(),
      );

  TextStyle _textStyle() =>
      TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w500);
}
