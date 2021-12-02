import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/domain/blocs/sign_in_bloc/bloc.dart';
import 'package:lohfinder_frontend/presentation/screens/events_list/events_list_screen.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_screen_title.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_text_field.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_validation_message.dart';

class SignInScreen extends StatefulWidget {
  static const String route = '/sign_in';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInInitial) {
            return buildUI(state);
          }
          return Container();
        },
      );

  Widget buildUI(SignInInitial state) => Scaffold(
        body: Column(
          children: [
            const LFHeader(showBackButton: true),
            SizedBox(height: 80.h),
            _title(),
            SizedBox(height: 80.h),
            _fields(state),
            SizedBox(height: 80.h),
            _signInButton(),
          ],
        ),
      );

  Widget _title() => const LFScreenTitle('Sign in');

  Widget _fields(SignInInitial state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 676.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _emailField(isValid: state.emailValidation.isValid),
            if (!state.emailValidation.isValid)
              LFValidationMessage(state.emailValidation.errorMessage!),
            SizedBox(height: 50.h),
            _passwordField(isValid: state.passwordValidation.isValid),
            if (!state.passwordValidation.isValid)
              LFValidationMessage(state.passwordValidation.errorMessage!),
            SizedBox(height: 40.h),
            _forgotPassword(),
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

  Widget _forgotPassword() => Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: _onForgotPasswordTap,
          child: Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 24.sp,
              color: LFColors.primaryDark,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );

  void _onForgotPasswordTap() {}

  Widget _signInButton() => LFButton(
        onPressed: _signIn,
        text: 'Sign in',
        enabled: _enableButton(),
      );

  bool _enableButton() => BlocProvider.of<SignInBloc>(context)
      .enableButton(_emailController.text, _passwordController.text);

  void _signIn() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      EventsListScreen.route,
      (route) => false,
    );
  }

  void _blocAddEvent(SignInEvent event) {
    BlocProvider.of<SignInBloc>(context).add(event);
  }
}
