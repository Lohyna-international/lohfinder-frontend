import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lohfinder_frontend/data/api/categories/mock_categories_service.dart';
import 'package:lohfinder_frontend/data/api/events/mock_events_service.dart';
import 'package:lohfinder_frontend/domain/blocs/events_list_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/blocs/sign_up/sign_up_flow_bloc/bloc.dart';
import 'package:lohfinder_frontend/domain/repositories/categories_repository.dart';
import 'package:lohfinder_frontend/domain/repositories/events_repository.dart';

import 'routes/route_generator.dart';
import 'screens/welcome/welcome_screen.dart';
import 'styles/design_config.dart';
import 'styles/lf_theme.dart';

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

  List<RepositoryProvider> _repositoryProviders() => <RepositoryProvider>[
        RepositoryProvider<CategoriesRepository>(
          create: (_) => CategoriesRepository(MockCategoriesService()),
        ),
        RepositoryProvider<EventsRepository>(
          create: (_) => EventsRepository(MockEventsService()),
        ),
      ];

  List<BlocProvider> _blocProviders() => <BlocProvider>[
        BlocProvider<EventsListBloc>(
          create: (context) => EventsListBloc(
            RepositoryProvider.of<EventsRepository>(context),
          )..add(LoadEvents()),
        ),
        BlocProvider<SignUpFlowBloc>(create: (_) => SignUpFlowBloc()),
      ];
}
