import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_text_field.dart';

import 'local_widgets/sign_up_step_title.dart';

class SignUpStepTwo extends StatefulWidget {
  static const String route = '/sign_up_step_two';

  const SignUpStepTwo({Key? key}) : super(key: key);

  @override
  _SignUpStepTwoState createState() => _SignUpStepTwoState();
}

class _SignUpStepTwoState extends State<SignUpStepTwo> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const LFHeader(),
            SizedBox(height: 20.h),
            const SignUpStepTitle(
              stepNumber: 2,
              titleText: 'Fill the fields below',
            ),
            SizedBox(height: 28.h),
            _fields(),
            SizedBox(height: 47.h),
            _nextButton(),
          ],
        ),
      );

  Widget _fields() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 676.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _emailField(),
            SizedBox(height: 38.h),
            _passwordField(),
            SizedBox(height: 38.h),
            _phoneField(),
            SizedBox(height: 38.h),
            _nameField(),
            SizedBox(height: 38.h),
            _ageField(),
          ],
        ),
      );

  Widget _emailField() => LFTextField(
        controller: _emailController,
        onChanged: (_) {},
        hintText: 'Email',
      );

  Widget _passwordField() => LFTextField(
        controller: _passwordController,
        onChanged: (_) {},
        hintText: 'Password',
        obscureText: true,
      );

  Widget _phoneField() => LFTextField(
        controller: _phoneController,
        onChanged: (_) {},
        hintText: 'Phone',
      );

  Widget _nameField() => LFTextField(
        controller: _nameController,
        onChanged: (_) {},
        hintText: 'Name',
      );

  Widget _ageField() => LFTextField(
        controller: _ageController,
        onChanged: (_) {},
        hintText: 'Age',
      );

  Widget _nextButton() => LFButton(
        onPressed: () {},
        text: 'Next',
      );
}
