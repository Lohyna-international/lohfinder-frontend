import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/domain/blocs/categories_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/repositories/categories_repository.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/categories_check_list.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_screen_title.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_text_field.dart';

class CreateEventScreen extends StatefulWidget {
  static const String route = '/create_event_screen';

  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _volunteersController = TextEditingController();
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
              LFHeader(onMenuPressed: _onMenuPressed),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 413.w),
                child: _content(),
              ),
            ],
          ),
        ),
      );

  void _onMenuPressed() {}

  Widget _content() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 35.h),
          _title(),
          SizedBox(height: 35.h),
          _image(),
          SizedBox(height: 35.h),
          _titleField(),
          SizedBox(height: 35.h),
          _descriptionField(),
          SizedBox(height: 35.h),
          _addressField(),
          SizedBox(height: 35.h),
          _dateField(),
          SizedBox(height: 35.h),
          _volunteersField(),
          SizedBox(height: 35.h),
          _categories(),
          SizedBox(height: 50.h),
          _createButton(),
          SizedBox(height: 50.h),
        ],
      );

  Widget _title() =>
      const LFScreenTitle('Fill the fields below to describe event');

  //TODO should be actual image
  Widget _image() => Container(
        width: 1093.w,
        height: 426.h,
        color: LFColors.secondaryDark,
        child: Icon(Icons.image, size: 128.r),
      );

  Widget _titleField() => LFTextField(
        controller: _titleController,
        onChanged: (_) {},
        hintText: 'Title',
      );

  Widget _descriptionField() => LFTextField(
        controller: _descriptionController,
        onChanged: (_) {},
        hintText: 'Description',
        linesCount: 5,
      );

  Widget _addressField() => LFTextField(
        controller: _addressController,
        onChanged: (_) {},
        hintText: 'Address',
      );

  Widget _dateField() => LFTextField(
        controller: _dateController,
        onChanged: (_) {},
        hintText: 'Date',
      );

  Widget _volunteersField() => LFTextField(
        controller: _volunteersController,
        onChanged: (_) {},
        hintText: 'Number of volunteers',
      );

  Widget _categories() => CategoriesCheckList(
        title: 'Categories',
        bloc: _categoriesBloc,
      );

  Widget _createButton() => LFButton(
        onPressed: _createEvent,
        text: 'Create event',
      );

  void _createEvent() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _categoriesBloc.close();
    super.dispose();
  }
}
