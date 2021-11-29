import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/models/category.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';

class CategoriesTags extends StatelessWidget {
  final List<Category> categories;

  const CategoriesTags(this.categories, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 19.w,
        children: categories.map(_tag).toList(),
      );

  Widget _tag(Category category) => Container(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 9.h),
        decoration: _categoryTagDecoration(),
        child: Text(category.title, style: TextStyle(fontSize: 24.sp)),
      );

  Decoration _categoryTagDecoration() => BoxDecoration(
        color: LFColors.primaryLight,
        borderRadius: BorderRadius.circular(10.r),
      );
}
