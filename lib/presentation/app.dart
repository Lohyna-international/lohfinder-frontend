import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home/home_screen.dart';
import 'styles/design_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: DesignConfig.size,
        builder: () => const MaterialApp(
          title: 'Lohfinder',
          home: HomeScreen(title: 'Lohfinder'),
        ),
      );
}
