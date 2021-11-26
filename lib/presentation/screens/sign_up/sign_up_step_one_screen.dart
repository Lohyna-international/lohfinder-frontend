import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_two_screen.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';

import 'local_widgets/sign_up_step_title.dart';

class SignUpStepOneScreen extends StatelessWidget {
  static const String route = '/sign_up_step_one';

  const SignUpStepOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const LFHeader(),
            SizedBox(height: 20.h),
            const SignUpStepTitle(
              stepNumber: 1,
              titleText: 'Tell us who you are',
            ),
            SizedBox(height: 66.h),
            LFButton(
              onPressed: () => _onVolunteerPressed(context),
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

  void _onVolunteerPressed(BuildContext context) {
    Navigator.pushNamed(context, SignUpStepTwoScreen.route);
  }
}
