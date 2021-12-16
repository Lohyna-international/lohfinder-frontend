import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/domain/blocs/categories_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/repositories/categories_repository.dart';
import 'package:lohfinder_frontend/presentation/screens/events_list/events_list_screen.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/categories_check_list.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_text_field.dart';

import 'local_widgets/sign_up_step_title.dart';

class SignUpStepThreeScreen extends StatefulWidget {
  static const String route = '/sign_up_step_three';

  const SignUpStepThreeScreen({Key? key}) : super(key: key);

  @override
  _SignUpStepThreeScreenState createState() => _SignUpStepThreeScreenState();
}

class _SignUpStepThreeScreenState extends State<SignUpStepThreeScreen> {
  final TextEditingController _bioController = TextEditingController();
  late final CategoriesBloc _categoriesBloc;

  @override
  void initState() {
    super.initState();
    _categoriesBloc = CategoriesBloc(
      RepositoryProvider.of<CategoriesRepository>(context),
    )..add(LoadCategories());
  }

  @override
  Widget build(BuildContext context) => buildUI();

  Widget buildUI() => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LFHeader(showBackButton: true),
              SizedBox(height: 20.h),
              const SignUpStepTitle(
                stepNumber: 3,
                titleText: 'Complete your profile',
              ),
              SizedBox(height: 44.h),
              _avatar(),
              SizedBox(height: 44.h),
              _bio(),
              SizedBox(height: 33.h),
              _interests(),
              SizedBox(height: 50.h),
              _signUpButton(),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      );

  Widget _avatar() => CircleAvatar(
        radius: 150.r,
        backgroundColor: LFColors.secondaryDark,
        child: Text(
          'Choose profile photo',
          style: TextStyle(
            color: LFColors.textPrimary,
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Widget _bio() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 397.w),
        child: LFTextField(
          controller: _bioController,
          onChanged: (_) {},
          hintText: 'Bio',
          linesCount: 10,
        ),
      );

  Widget _interests() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 397.w),
        child: CategoriesCheckList(
          title: 'Set your interests',
          bloc: _categoriesBloc,
        ),
      );

  Widget _signUpButton() => LFButton(onPressed: _signUp, text: 'Sign up');

  void _signUp() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      EventsListScreen.route,
      (route) => false,
    );
  }

  @override
  void dispose() {
    _categoriesBloc.close();
    super.dispose();
  }
}
