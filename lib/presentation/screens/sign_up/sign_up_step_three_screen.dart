import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/models/category.dart';
import 'package:lohfinder_frontend/domain/blocs/sign_up/sign_up_step_three_bloc/bloc.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_checkbox_tile.dart';
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

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SignUpStepThreeBloc, SignUpStepThreeState>(
        builder: (context, state) {
          if (state is SignUpStepThreeLoaded) {
            return buildUI(categories: state.allCategories);
          }
          return Container();
        },
      );

  Widget buildUI({required List<Category> categories}) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LFHeader(),
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
              _interests(categories: categories),
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

  Widget _interests({required List<Category> categories}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 397.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _setYourInterests(),
            SizedBox(height: 17.h),
            ..._interestsList(categories: categories),
          ],
        ),
      );

  Widget _setYourInterests() => Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Set your interests',
          style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
        ),
      );

  List<Widget> _interestsList({required List<Category> categories}) =>
      categories.map((cat) => _categoryTile(cat)).toList();

  Widget _categoryTile(Category category) => LFCheckboxTile(
        value: BlocProvider.of<SignUpStepThreeBloc>(context)
            .isCategorySelected(category),
        onChanged: (_) {
          BlocProvider.of<SignUpStepThreeBloc>(context)
              .add(CheckCategory(category));
        },
        title: category.title,
      );

  Widget _signUpButton() => LFButton(onPressed: () {}, text: 'Sign up');
}
