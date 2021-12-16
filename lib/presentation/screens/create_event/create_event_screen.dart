import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/domain/blocs/categories_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/blocs/create_event_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/repositories/categories_repository.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_colors.dart';
import 'package:lohfinder_frontend/presentation/widgets/categories_check_list.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_button.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_header.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_screen_title.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_text_field.dart';
import 'package:lohfinder_frontend/presentation/widgets/lf_validation_message.dart';

class CreateEventScreen extends StatefulWidget {
  static const String route = '/create_event_screen';

  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  late final CreateEventBloc _bloc;
  late final CategoriesBloc _categoriesBloc;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _volunteersController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bloc = CreateEventBloc();
    _categoriesBloc = CategoriesBloc(
      RepositoryProvider.of<CategoriesRepository>(context),
    )..add(LoadCategories());
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<CreateEventBloc, CreateEventState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CreateEventInitial) {
            return buildUI(state);
          }
          return Container();
        },
      );

  Widget buildUI(CreateEventInitial state) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const LFHeader(showMenuButton: true, showBackButton: true),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 413.w),
                child: _content(state),
              ),
            ],
          ),
        ),
      );

  Widget _content(CreateEventInitial state) => Column(
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
          _dateField(isValid: state.dateValidation.isValid),
          if (!state.dateValidation.isValid)
            LFValidationMessage(state.dateValidation.errorMessage!),
          SizedBox(height: 35.h),
          _volunteersField(isValid: state.volunteersValidation.isValid),
          if (!state.volunteersValidation.isValid)
            LFValidationMessage(state.volunteersValidation.errorMessage!),
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
        onChanged: (_) {
          _bloc.add(RequiredFieldChanged());
        },
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
        onChanged: (_) {
          _bloc.add(RequiredFieldChanged());
        },
        hintText: 'Address',
      );

  Widget _dateField({required bool isValid}) => LFTextField(
        controller: _dateController,
        onChanged: (text) {
          _bloc.add(DateChanged(text));
        },
        hintText: 'Date (dd.mm.yyyy)',
      );

  Widget _volunteersField({required bool isValid}) => LFTextField(
        controller: _volunteersController,
        onChanged: (text) {
          _bloc.add(VolunteersChanged(text));
        },
        hintText: 'Number of volunteers',
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      );

  Widget _categories() => CategoriesCheckList(
        title: 'Categories',
        bloc: _categoriesBloc,
      );

  Widget _createButton() => LFButton(
        onPressed: _createEvent,
        text: 'Create event',
        enabled: _enableButton(),
      );

  bool _enableButton() => _bloc.enableButton(
        title: _titleController.text,
        address: _addressController.text,
        date: _dateController.text,
        volunteers: _volunteersController.text,
      );

  void _createEvent() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _bloc.close();
    _categoriesBloc.close();
    super.dispose();
  }
}
