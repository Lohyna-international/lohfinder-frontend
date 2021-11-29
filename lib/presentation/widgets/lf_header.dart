import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class LFHeader extends StatelessWidget {
  //TODO probably should be handled by MenuBloc, not passed as parameter
  final void Function()? onMenuPressed;

  const LFHeader({Key? key, this.onMenuPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 80.w),
        height: 180.h,
        width: double.infinity,
        color: LFColors.primaryLight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _title(),
            if (onMenuPressed != null) ...[
              const Spacer(),
              _menuButton(),
            ],
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

  Widget _menuButton() => IconButton(
        icon: Icon(Icons.menu, size: 64.r, color: LFColors.textPrimary),
        onPressed: onMenuPressed,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(minWidth: 72.r, minHeight: 72.r),
      );
}
