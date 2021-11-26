import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_text_field.dart';

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
  Widget build(BuildContext context) => buildUI();

  Widget buildUI() => Scaffold(
        body: Column(
          children: [
            const LFHeader(),
            SizedBox(height: 80.h),
            _title(),
            SizedBox(height: 80.h),
            _fields(),
            SizedBox(height: 80.h),
            _signInButton(),
          ],
        ),
      );

  Widget _title() => Text(
        'Sign in',
        style: TextStyle(fontSize: 48.sp, fontWeight: FontWeight.w500),
      );

  Widget _fields() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 676.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _emailField(),
            SizedBox(height: 50.h),
            _passwordField(),
            SizedBox(height: 40.h),
            _forgotPassword(),
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

  Widget _signInButton() => LFButton(onPressed: _signIn, text: 'Sign in');

  void _signIn() {}
}
