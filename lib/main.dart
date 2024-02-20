import 'package:care_connect/resources/themes/themes.dart';
import 'package:care_connect/views/onboarding/onboarding_view.dart';

import 'package:flutter/material.dart';

import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// CupertinoIcons.ellipses_bubble_fill
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnboardingView(),
      theme: MyTheme.lightTheme(),
      onGenerateRoute: Routes.genrateRoute,
    );
  }
}
