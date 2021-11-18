import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';

import 'local_widgets/sign_up_step_title.dart';

class SignUpStepOne extends StatelessWidget {
  static const String route = '/sign_up_step_one';

  const SignUpStepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const LFHeader(),
            SizedBox(height: 45.h),
            const SignUpStepTitle(
              stepNumber: 1,
              titleText: 'Tell us who you are',
            ),
            SizedBox(height: 66.h),
            LFButton(
              onPressed: () {},
              text: "I'm a volunteer",
            ),
            SizedBox(height: 66.h),
            LFButton(
              onPressed: () {},
              text: "I'm an organisator",
            ),
          ],
        ),
      );
}
