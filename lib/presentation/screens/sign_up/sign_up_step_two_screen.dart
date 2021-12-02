import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/domain/blocs/sign_up/sign_up_flow_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/blocs/sign_up/sign_up_step_two_bloc/bloc.dart';
import 'package:lohfinder_frontend/presentation/screens/sign_up/sign_up_step_three_screen.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_text_field.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_validation_message.dart';

import 'local_widgets/sign_up_step_title.dart';

class SignUpStepTwoScreen extends StatefulWidget {
  static const String route = '/sign_up_step_two';

  const SignUpStepTwoScreen({Key? key}) : super(key: key);

  @override
  _SignUpStepTwoScreenState createState() => _SignUpStepTwoScreenState();
}

class _SignUpStepTwoScreenState extends State<SignUpStepTwoScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SignUpStepTwoBloc, SignUpStepTwoState>(
        builder: (context, state) {
          if (state is SignUpStepTwoInitial) {
            return buildUI(state);
          }
          return Container();
        },
      );

  Widget buildUI(SignUpStepTwoInitial state) => Scaffold(
        body: Column(
          children: [
            const LFHeader(showBackButton: true),
            SizedBox(height: 20.h),
            const SignUpStepTitle(
              stepNumber: 2,
              titleText: 'Fill the fields below',
            ),
            SizedBox(height: 28.h),
            _fields(state),
            SizedBox(height: 47.h),
            _nextButton(),
          ],
        ),
      );

  Widget _fields(SignUpStepTwoInitial state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 676.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _emailField(isValid: state.emailValidation.isValid),
            if (!state.emailValidation.isValid)
              LFValidationMessage(state.emailValidation.errorMessage!),
            SizedBox(height: 38.h),
            _passwordField(isValid: state.passwordValidation.isValid),
            if (!state.passwordValidation.isValid)
              LFValidationMessage(state.passwordValidation.errorMessage!),
            SizedBox(height: 38.h),
            _phoneField(isValid: state.phoneValidation.isValid),
            if (!state.phoneValidation.isValid)
              LFValidationMessage(state.phoneValidation.errorMessage!),
            SizedBox(height: 38.h),
            _nameField(isValid: state.nameValidation.isValid),
            if (!state.nameValidation.isValid)
              LFValidationMessage(state.nameValidation.errorMessage!),
            if (_isVolunteer()) ...[
              SizedBox(height: 38.h),
              _ageField(isValid: state.ageValidation.isValid),
              if (!state.ageValidation.isValid)
                LFValidationMessage(state.ageValidation.errorMessage!),
            ],
          ],
        ),
      );

  Widget _emailField({required bool isValid}) => LFTextField(
        controller: _emailController,
        onChanged: (text) {
          _blocAddEvent(EmailChanged(text));
        },
        hintText: 'Email',
        isValid: isValid,
      );

  Widget _passwordField({required bool isValid}) => LFTextField(
        controller: _passwordController,
        onChanged: (text) {
          _blocAddEvent(PasswordChanged(text));
        },
        hintText: 'Password',
        obscureText: true,
        isValid: isValid,
      );

  Widget _phoneField({required bool isValid}) => LFTextField(
        controller: _phoneController,
        onChanged: (text) {
          _blocAddEvent(PhoneChanged(text));
        },
        hintText: 'Phone',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        isValid: isValid,
      );

  Widget _nameField({required bool isValid}) => LFTextField(
        controller: _nameController,
        onChanged: (text) {
          _blocAddEvent(NameChanged(text));
        },
        hintText: _isVolunteer() ? 'Name' : 'Company name',
        isValid: isValid,
      );

  Widget _ageField({required bool isValid}) => LFTextField(
        controller: _ageController,
        onChanged: (text) {
          _blocAddEvent(AgeChanged(text));
        },
        hintText: 'Age',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        isValid: isValid,
      );

  Widget _nextButton() => LFButton(
        onPressed: _goNext,
        text: 'Next',
        enabled: _enableButton(),
      );

  void _goNext() {
    Navigator.pushNamed(context, SignUpStepThreeScreen.route);
  }

  bool _isVolunteer() =>
      BlocProvider.of<SignUpFlowBloc>(context).isVolunteerFlow();

  bool _enableButton() =>
      BlocProvider.of<SignUpStepTwoBloc>(context).enableButton(
        _emailController.text,
        _passwordController.text,
        _phoneController.text,
        _nameController.text,
        _ageController.text,
        isVolunteer: _isVolunteer(),
      );

  void _blocAddEvent(SignUpStepTwoEvent event) {
    BlocProvider.of<SignUpStepTwoBloc>(context).add(event);
  }
}
