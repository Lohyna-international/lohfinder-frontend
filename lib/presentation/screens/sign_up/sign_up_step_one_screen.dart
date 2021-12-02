import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/domain/blocs/sign_up/sign_up_flow_bloc/bloc.dart';
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
            const LFHeader(showBackButton: true),
            SizedBox(height: 20.h),
            const SignUpStepTitle(
              stepNumber: 1,
              titleText: 'Tell us who you are',
            ),
            SizedBox(height: 66.h),
            LFButton(
              onPressed: () => _onButtonPressed(
                context,
                SignUpFlowType.volunteer,
              ),
              text: "I'm a volunteer",
            ),
            SizedBox(height: 66.h),
            LFButton(
              onPressed: () => _onButtonPressed(
                context,
                SignUpFlowType.organizer,
              ),
              text: "I'm an organizer",
            ),
          ],
        ),
      );

  void _onButtonPressed(BuildContext context, SignUpFlowType type) {
    BlocProvider.of<SignUpFlowBloc>(context).add(FlowStarted(type: type));
    Navigator.pushNamed(context, SignUpStepTwoScreen.route);
  }
}
