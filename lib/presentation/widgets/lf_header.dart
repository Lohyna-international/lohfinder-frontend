import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_menu.dart';

class LFHeader extends StatelessWidget {
  final bool showMenuButton;
  final bool showBackButton;

  const LFHeader({
    Key? key,
    this.showMenuButton = false,
    this.showBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 80.w),
        height: 180.h,
        width: double.infinity,
        color: LFColors.primaryLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showBackButton) ...[
              _backButton(context),
              const Spacer(),
            ],
            _title(),
            if (showBackButton || showMenuButton) const Spacer(),
            if (showMenuButton) const LFMenu(),
          ],
        ),
      );

  Widget _title() => Text(
        'Lohfinder',
        style: TextStyle(
          fontSize: 72.sp,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _backButton(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back, size: 64.r, color: LFColors.textPrimary),
        onPressed: () => Navigator.pop(context),
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minWidth: 72.r, minHeight: 72.r),
      );
}
