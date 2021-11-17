import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class WelcomeScreen extends StatelessWidget {
  static const String route = '/';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 162.w),
          child: Column(
            children: <Widget>[
              SizedBox(height: 233.h),
              _title(),
              SizedBox(height: 72.h),
              _appDescription(),
              SizedBox(height: 158.h),
              _accountText(
                introText: 'First time here? ',
                signText: 'Sign up',
                onTap: () => _onSignUpTap(context),
              ),
              SizedBox(height: 50.h),
              _accountText(
                introText: 'Or maybe you already have an account? Then, ',
                signText: 'Sign in',
                onTap: _onSignInTap,
              ),
            ],
          ),
        ),
      );

  Widget _title() => Text(
        'Welcome to Lohfinder!',
        style: TextStyle(
          color: LFColors.primary,
          fontSize: 72.sp,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _appDescription() => Text(
        'This is a beautiful app which helps organisations to find volunteers '
        'for events and from the other side it helps people to find '
        'interesting events where they can gain some volunteering '
        'experience.',
        style: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _accountText({
    required String introText,
    required String signText,
    required void Function() onTap,
  }) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(introText, style: TextStyle(fontSize: 32.sp)),
          InkWell(
            onTap: onTap,
            child: Text(
              signText,
              style: TextStyle(
                fontSize: 32.sp,
                color: LFColors.primaryDark,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
        ],
      );

  void _onSignUpTap(BuildContext context) {}

  void _onSignInTap() {}
}
