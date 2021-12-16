import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_divider.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_section_title.dart';

class InfoSection extends StatelessWidget {
  final String title;
  final String? text;
  final Widget? infoWidget;

  const InfoSection({
    Key? key,
    required this.title,
    this.text,
    this.infoWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          LFSectionTitle(title),
          SizedBox(height: 20.h),
          if (text != null) Text(text!, style: TextStyle(fontSize: 32.sp)),
          if (infoWidget != null) infoWidget!,
          SizedBox(height: 20.h),
          const LFDivider(),
          SizedBox(height: 20.h),
        ],
      );
}
