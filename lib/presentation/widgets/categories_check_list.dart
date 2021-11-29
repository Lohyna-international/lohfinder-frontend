import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/models/category.dart';
import 'package:lohfinder_frontend/domain/blocs/categories_bloc/bloc.dart';

import 'lf_checkbox_tile.dart';

class CategoriesCheckList extends StatelessWidget {
  final String title;
  final CategoriesBloc bloc;

  const CategoriesCheckList({
    Key? key,
    required this.title,
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CategoriesBloc, CategoriesState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            return buildUI(categories: state.allCategories);
          }
          return Container();
        },
      );

  Widget buildUI({required List<Category> categories}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _title(),
          SizedBox(height: 17.h),
          ..._categoriesList(categories),
        ],
      );

  Widget _title() => Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.w500),
        ),
      );

  List<Widget> _categoriesList(List<Category> categories) =>
      categories.map(_categoryTile).toList();

  Widget _categoryTile(Category category) => LFCheckboxTile(
        value: bloc.isCategorySelected(category),
        onChanged: (_) {
          bloc.add(CheckCategory(category));
        },
        title: category.title,
      );
}
