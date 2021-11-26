import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/api/categories/mock_categories_service.dart';
import 'package:lohfinder_frontend/domain/blocs/sign_up/sign_up_step_three_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/repositories/categories_repository.dart';
import 'package:lohfinder_frontend/presentation/styles/lf_theme.dart';

import 'routes/route_generator.dart';
import 'screens/welcome/welcome_screen.dart';
import 'styles/design_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: _repositoryProviders(),
        child: MultiBlocProvider(
          providers: _blocProviders(),
          child: ScreenUtilInit(
            designSize: DesignConfig.size,
            builder: () => MaterialApp(
              title: 'Lohfinder',
              initialRoute: WelcomeScreen.route,
              onGenerateRoute: RouteGenerator.generateRoute,
              theme: LFTheme.theme,
              debugShowCheckedModeBanner: false,
            ),
          ),
        ),
      );

  _repositoryProviders() => [
        RepositoryProvider<CategoriesRepository>(
          create: (_) => CategoriesRepository(MockCategoriesService()),
        ),
      ];

  _blocProviders() => [
        BlocProvider<SignUpStepThreeBloc>(
          create: (context) => SignUpStepThreeBloc(
            RepositoryProvider.of<CategoriesRepository>(context),
          )..add(LoadSignUpStepThree()),
        ),
      ];
}
